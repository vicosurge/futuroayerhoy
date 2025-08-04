#!/bin/bash

# Advanced Post Migration Script for El futuro del ayer, hoy
# This script creates backups and handles edge cases

# Configuration
DRY_RUN=false
CREATE_BACKUP=true
BACKUP_DIR="backup_posts_$(date +%Y%m%d_%H%M%S)"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run)
            DRY_RUN=true
            echo "DRY RUN MODE - No files will be moved"
            shift
            ;;
        --no-backup)
            CREATE_BACKUP=false
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [OPTIONS]"
            echo "Options:"
            echo "  --dry-run     Show what would be moved without actually moving files"
            echo "  --no-backup   Skip creating backup of _posts directory"
            echo "  -h, --help    Show this help message"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Collection directories to create
declare -A COLLECTIONS=(
    ["_cuentos"]="Cuentos y historias cortas"
    ["_poesia"]="Poemas y versos"
    ["_ensayos"]="Ensayos y reflexiones" 
    ["_resenas"]="Reseñas literarias"
    ["_convocatorias"]="Convocatorias y anuncios"
    ["_cartas"]="Cartas e información del comité"
)

# Category mappings (handles various spellings and cases)
get_target_folder() {
    local category="$1"
    # Convert to lowercase and remove accents for comparison
    local normalized=$(echo "$category" | tr '[:upper:]' '[:lower:]' | sed 's/ñ/n/g' | sed 's/á/a/g' | sed 's/é/e/g' | sed 's/í/i/g' | sed 's/ó/o/g' | sed 's/ú/u/g')
    
    case "$normalized" in
        *"poesia"*|*"poesia"*)
            echo "_poesia"
            ;;
        *"historia"*|*"cuento"*|*"relato"*|*"narrativa"*)
            echo "_cuentos"
            ;;
        *"ensayo"*)
            echo "_ensayos"
            ;;
        *"resena"*|*"resena"*|*"critica"*)
            echo "_resenas"
            ;;
        *"convocatoria"*|*"anuncio"*)
            echo "_convocatorias"
            ;;
        *"carta"*|*"comite"*|*"informacion"*|*"editorial"*)
            echo "_cartas"
            ;;
        *)
            echo "_posts"  # Keep in _posts if category doesn't match
            ;;
    esac
}

# Function to extract category from front matter (improved)
get_category() {
    local file="$1"
    # Look for category or categories, handle arrays and single values
    local category_line=$(grep -i "^categories\|^category" "$file" | head -1)
    
    if [ -n "$category_line" ]; then
        # Remove the key part and clean up the value
        local category=$(echo "$category_line" | sed 's/^[^:]*: *//' | sed 's/^\[//' | sed 's/\]$//' | sed 's/^"//' | sed 's/"$//' | sed 's/^ *//;s/ *$//')
        # If it's an array, take the first element
        category=$(echo "$category" | cut -d',' -f1 | sed 's/^ *//;s/ *$//' | sed 's/^"//' | sed 's/"$//')
        echo "$category"
    fi
}

# Function to get post info for display
get_post_info() {
    local file="$1"
    local title=$(grep "^title:" "$file" | head -1 | sed 's/title: *//' | sed 's/^"//' | sed 's/"$//')
    local author=$(grep "^author:" "$file" | head -1 | sed 's/author: *//' | sed 's/^"//' | sed 's/"$//')
    local date=$(grep "^date:" "$file" | head -1 | sed 's/date: *//' | cut -d' ' -f1)
    
    echo "\"$title\" by $author ($date)"
}

echo -e "${BLUE}╔══════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║        Post Migration Script v2.0            ║${NC}"
echo -e "${BLUE}║     El futuro del ayer, hoy Archive          ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════╝${NC}\n"

# Check if _posts directory exists
if [ ! -d "_posts" ]; then
    echo -e "${RED}Error: _posts directory not found!${NC}"
    exit 1
fi

# Create backup if requested
if [ "$CREATE_BACKUP" = true ] && [ "$DRY_RUN" = false ]; then
    echo -e "${YELLOW}Creating backup of _posts directory...${NC}"
    cp -r "_posts" "$BACKUP_DIR"
    echo -e "${GREEN}Backup created: $BACKUP_DIR${NC}\n"
fi

# Create collection directories
echo -e "${BLUE}Setting up collection directories...${NC}"
for dir in "${!COLLECTIONS[@]}"; do
    if [ "$DRY_RUN" = false ]; then
        mkdir -p "$dir"
    fi
    echo -e "${GREEN}$dir${NC} - ${COLLECTIONS[$dir]}"
done
echo ""

# Initialize counters
moved_count=0
skipped_count=0
error_count=0

# Initialize arrays to track moves
declare -A moves_by_collection

# Process each markdown file in _posts
echo -e "${PURPLE}Processing posts...${NC}\n"

for post in _posts/*.md _posts/*.markdown; do
    # Skip if no files match the pattern
    [ ! -f "$post" ] && continue
    
    filename=$(basename "$post")
    
    # Extract category and post info
    category=$(get_category "$post")
    post_info=$(get_post_info "$post")
    
    echo -e "${YELLOW}📄 $filename${NC}"
    echo -e "   ℹ️  $post_info"
    
    if [ -z "$category" ]; then
        echo -e "   ${RED}⚠️  No category found, keeping in _posts${NC}"
        ((skipped_count++))
        echo ""
        continue
    fi
    
    # Determine target folder
    target_folder=$(get_target_folder "$category")
    
    echo -e "   📂 Category: ${GREEN}$category${NC}"
    echo -e "   🎯 Target: ${GREEN}$target_folder${NC}"
    
    # If target is still _posts, skip moving
    if [ "$target_folder" = "_posts" ]; then
        echo -e "   ${YELLOW}❓ No matching collection, keeping in _posts${NC}"
        ((skipped_count++))
        echo ""
        continue
    fi
    
    # Track the move
    if [ -z "${moves_by_collection[$target_folder]}" ]; then
        moves_by_collection[$target_folder]=1
    else
        ((moves_by_collection[$target_folder]++))
    fi
    
    # Move the file (or simulate in dry run)
    if [ "$DRY_RUN" = true ]; then
        echo -e "   ${BLUE}🔄 Would move to $target_folder/${NC}"
        ((moved_count++))
    else
        if mv "$post" "$target_folder/"; then
            echo -e "   ${GREEN}✅ Moved successfully${NC}"
            ((moved_count++))
        else
            echo -e "   ${RED}❌ Error moving file${NC}"
            ((error_count++))
        fi
    fi
    
    echo ""
done

# Summary
echo -e "${BLUE}╔══════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                SUMMARY                       ║${NC}"  
echo -e "${BLUE}╚══════════════════════════════════════════════╝${NC}"

if [ "$DRY_RUN" = true ]; then
    echo -e "${BLUE}DRY RUN RESULTS:${NC}"
    echo -e "${GREEN}Would move: $moved_count files${NC}"
else
    echo -e "${GREEN}Successfully moved: $moved_count files${NC}"
fi

echo -e "${YELLOW}Skipped: $skipped_count files${NC}"
echo -e "${RED}Errors: $error_count files${NC}"

# Show distribution by collection
echo -e "\n${PURPLE}Distribution by Collection:${NC}"
for dir in "${!COLLECTIONS[@]}"; do
    count=${moves_by_collection[$dir]:-0}
    if [ $count -gt 0 ]; then
        echo -e "${GREEN}$dir: $count files${NC}"
    else
        echo -e "${GREEN}$dir: 0 files${NC}"
    fi
done

# Show remaining files in _posts
if [ "$DRY_RUN" = false ]; then
    remaining=$(find "_posts" -name "*.md" -o -name "*.markdown" 2>/dev/null | wc -l)
    echo -e "${YELLOW}_posts: $remaining files remaining${NC}"
fi

echo -e "\n${GREEN}🎉 Migration completed!${NC}"

if [ "$DRY_RUN" = true ]; then
    echo -e "${BLUE}ℹ️  This was a dry run. Run without --dry-run to actually move files.${NC}"
elif [ "$CREATE_BACKUP" = true ]; then
    echo -e "${BLUE}ℹ️  Backup available at: $BACKUP_DIR${NC}"
fi

echo -e "${BLUE}📝 Next steps:${NC}"
echo -e "   1. Review moved files in their new locations"
echo -e "   2. Update your _config.yml if needed"
echo -e "   3. Test your Jekyll site with: bundle exec jekyll serve"
