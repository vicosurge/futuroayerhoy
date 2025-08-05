#!/bin/bash

# Bulk Text to Markdown Converter for El futuro del ayer, hoy
# This script helps convert multiple text files to Jekyll markdown posts

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Bulk Text to Markdown Converter ===${NC}"
echo -e "${BLUE}For El futuro del ayer, hoy${NC}\n"

# Function to create a markdown file from text
create_markdown_post() {
    local title="$1"
    local author="$2"
    local category="$3"
    local date="$4"
    local content="$5"
    local filename="$6"
    
    # Determine target directory based on category
    case "$category" in
        "poesia"|"Poesía")
            target_dir="_poesia"
            category_clean="poesia"
            ;;
        "cuento"|"historia-corta"|"Historia-Corta")
            target_dir="_cuentos"
            category_clean="cuentos"
            ;;
        "ensayo"|"Ensayo")
            target_dir="_ensayos"
            category_clean="ensayos"
            ;;
        "resena"|"reseña"|"Reseña")
            target_dir="_resenas"
            category_clean="resenas"
            ;;
        "convocatoria"|"Convocatoria")
            target_dir="_convocatorias"
            category_clean="convocatorias"
            ;;
        *)
            target_dir="_posts"
            category_clean="$category"
            ;;
    esac
    
    # Create directory if it doesn't exist
    mkdir -p "$target_dir"
    
    # Generate filename if not provided
    if [ -z "$filename" ]; then
        # Clean title for filename
        clean_title=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9 ]//g' | tr ' ' '-' | sed 's/--*/-/g')
        filename="${date}-${clean_title}.md"
    fi
    
    # Create the markdown file
    cat > "${target_dir}/${filename}" << EOF
---
layout: post
title: "${title}"
date: ${date} 00:00:00 -0800
categories: ${category_clean}
tags: ${category_clean}
author: ${author}
---

${content}
EOF

    echo -e "${GREEN}✓ Created: ${target_dir}/${filename}${NC}"
}

# Interactive mode for single file conversion
convert_single_file() {
    echo -e "${YELLOW}=== Single File Conversion ===${NC}"
    
    echo -n "Enter title: "
    read title
    
    echo -n "Enter author: "
    read author
    
    echo "Select category:"
    echo "1) Poesía"
    echo "2) Cuento/Historia Corta"
    echo "3) Ensayo"
    echo "4) Reseña"
    echo "5) Convocatoria"
    echo "6) Other (specify)"
    echo -n "Choice (1-6): "
    read choice
    
    case $choice in
        1) category="poesia" ;;
        2) category="cuentos" ;;
        3) category="ensayos" ;;
        4) category="resenas" ;;
        5) category="convocatorias" ;;
        6) 
            echo -n "Enter category: "
            read category
            ;;
        *) category="posts" ;;
    esac
    
    echo -n "Enter date (YYYY-MM-DD): "
    read date
    
    echo "Enter content (press Ctrl+D when finished):"
    content=$(cat)
    
    create_markdown_post "$title" "$author" "$category" "$date" "$content"
}

# Batch mode for multiple files
convert_batch_files() {
    echo -e "${YELLOW}=== Batch File Conversion ===${NC}"
    echo "Place your text files in a 'source_texts' directory"
    echo "File naming convention: YYYY-MM-DD-title-author-category.txt"
    echo "Example: 2019-03-15-mi-poema-juan-perez-poesia.txt"
    echo ""
    
    if [ ! -d "source_texts" ]; then
        echo -e "${RED}Error: source_texts directory not found!${NC}"
        echo "Create it and add your text files, then run this script again."
        return 1
    fi
    
    for file in source_texts/*.txt; do
        [ ! -f "$file" ] && continue
        
        filename=$(basename "$file" .txt)
        
        # Try to parse filename: date-title-author-category
        if [[ $filename =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.+)-([^-]+)-([^-]+)$ ]]; then
            date="${BASH_REMATCH[1]}"
            title=$(echo "${BASH_REMATCH[2]}" | tr '-' ' ' | sed 's/\b\w/\U&/g')
            author=$(echo "${BASH_REMATCH[3]}" | tr '-' ' ' | sed 's/\b\w/\U&/g')
            category="${BASH_REMATCH[4]}"
            
            content=$(cat "$file")
            
            echo -e "${BLUE}Processing: $filename${NC}"
            echo -e "  Title: $title"
            echo -e "  Author: $author"
            echo -e "  Category: $category"
            echo -e "  Date: $date"
            
            create_markdown_post "$title" "$author" "$category" "$date" "$content"
            echo ""
        else
            echo -e "${YELLOW}⚠ Skipping $filename (doesn't match naming convention)${NC}"
        fi
    done
}

# Template generator
generate_template() {
    echo -e "${YELLOW}=== Template Generator ===${NC}"
    
    cat > "post_template.md" << 'EOF'
---
layout: post
title: "TÍTULO DEL TEXTO"
date: YYYY-MM-DD 00:00:00 -0800
categories: CATEGORÍA
tags: CATEGORÍA
author: NOMBRE DEL AUTOR
---

CONTENIDO DEL TEXTO AQUÍ

Puedes usar **negrita** y *cursiva*.

Para párrafos, simplemente separa con líneas en blanco.

Para citas:
> Esto es una cita

Para listas:
- Elemento 1
- Elemento 2
- Elemento 3
EOF

    echo -e "${GREEN}✓ Created post_template.md${NC}"
    echo "Edit this template and save copies for each post you want to create."
}

# CSV to Markdown converter
convert_from_csv() {
    echo -e "${YELLOW}=== CSV to Markdown Converter ===${NC}"
    echo "Create a CSV file named 'posts.csv' with columns:"
    echo "title,author,category,date,content"
    echo ""
    
    if [ ! -f "posts.csv" ]; then
        echo -e "${RED}Error: posts.csv not found!${NC}"
        echo "Create it with your post data, then run this script again."
        return 1
    fi
    
    # Skip header line and process CSV
    tail -n +2 posts.csv | while IFS=, read -r title author category date content; do
        # Remove quotes if present
        title=$(echo "$title" | sed 's/^"//;s/"$//')
        author=$(echo "$author" | sed 's/^"//;s/"$//')
        category=$(echo "$category" | sed 's/^"//;s/"$//')
        date=$(echo "$date" | sed 's/^"//;s/"$//')
        content=$(echo "$content" | sed 's/^"//;s/"$//')
        
        # Replace \n with actual newlines in content
        content=$(echo "$content" | sed 's/\\n/\n/g')
        
        echo -e "${BLUE}Processing: $title${NC}"
        create_markdown_post "$title" "$author" "$category" "$date" "$content"
    done
}

# Main menu
while true; do
    echo -e "\n${BLUE}Choose conversion method:${NC}"
    echo "1) Single file (interactive)"
    echo "2) Batch files (from source_texts/)"
    echo "3) Generate template"
    echo "4) Convert from CSV"
    echo "5) Exit"
    echo -n "Choice (1-5): "
    read choice
    
    case $choice in
        1) convert_single_file ;;
        2) convert_batch_files ;;
        3) generate_template ;;
        4) convert_from_csv ;;
        5) 
            echo -e "${GREEN}Goodbye!${NC}"
            exit 0
            ;;
        *) echo -e "${RED}Invalid choice. Please try again.${NC}" ;;
    esac
done
