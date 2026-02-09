---
layout: page
title: Envíos
permalink: /envios/
---

<div class="category-header">
  <h1>📮 Envía tu Obra</h1>
  <p class="category-description">
    Comparte tu poesía, ensayos o cuentos con nosotros. Aceptamos obras originales
    en español de autores de todo el mundo.
  </p>
</div>

<div class="submission-guidelines">
  <h2>Lineamientos de Envío</h2>

  <h3>Tipos de Obras Aceptadas</h3>
  <ul>
    <li><strong>Poesía:</strong> Poemas originales de cualquier estilo o extensión</li>
    <li><strong>Ensayo:</strong> Reflexiones literarias, culturales o filosóficas</li>
    <li><strong>Cuento:</strong> Narrativas breves hasta 5,000 palabras</li>
    <li><strong>Ilustración:</strong> Arte visual original (fotografía, dibujo, pintura digital, etc.)</li>
  </ul>

  <h3>Requisitos</h3>
  <ul>
    <li>Obras originales e inéditas</li>
    <li>Escritas en español</li>
    <li>Formatos aceptados: .docx, .doc, .odt, .rtf, .txt, .pdf</li>
    <li>Tamaño máximo: 10MB</li>
  </ul>

  <h3>Proceso de Revisión</h3>
  <p>
    Nuestro comité editorial revisará tu obra y te contactaremos por correo electrónico
    en un plazo de 4 a 6 semanas. Todas las obras son consideradas cuidadosamente.
  </p>
</div>

<div class="submission-form-container">
  <h2>Formulario de Envío</h2>

  <form id="submissionForm" class="submission-form">
    <div class="form-group">
      <label for="nombre">Nombre Completo *</label>
      <input type="text" id="nombre" name="nombre" required>
    </div>

    <div class="form-group">
      <label for="email">Correo Electrónico *</label>
      <input type="email" id="email" name="email" required>
    </div>

    <div class="form-group">
      <label for="tipo">Tipo de Obra *</label>
      <select id="tipo" name="tipo" required>
        <option value="">Selecciona una opción</option>
        <option value="poesia">Poesía</option>
        <option value="ensayo">Ensayo</option>
        <option value="cuento">Cuento</option>
        <option value="ilustracion">Ilustración</option>
      </select>
    </div>

    <div class="form-group">
      <label for="titulo">Título de la Obra *</label>
      <input type="text" id="titulo" name="titulo" required>
    </div>

    <div class="form-group">
      <label for="bio">Biografía del Autor *</label>
      <textarea id="bio" name="bio" rows="4" required
        placeholder="Una breve biografía (100-200 palabras) que incluya tu formación, publicaciones previas, o cualquier información relevante."></textarea>
    </div>

    <div class="form-group">
      <label for="notas">Notas Adicionales *</label>
      <textarea id="notas" name="notas" rows="4" required
        placeholder="Cualquier información adicional que desees compartir sobre tu obra o tu proceso creativo."></textarea>
    </div>

    <div class="form-group">
      <label for="archivo">Archivo de la Obra *</label>
      <input type="file" id="archivo" name="archivo" required
        accept=".docx,.doc,.odt,.rtf,.txt,.pdf,.png,.jpg,.jpeg,.tiff">
      <small>Formatos aceptados: .docx, .doc, .odt, .rtf, .txt, .pdf, .png, .jpg, .jpeg, .tiff (máx. 10MB)</small>
    </div>

    <div class="form-actions">
      <button type="submit" class="submit-button">Enviar Obra</button>
    </div>

    <div id="formMessage" class="form-message"></div>
  </form>
</div>

<style>
.submission-guidelines {
  background: #f9f9f9;
  padding: 30px;
  border-radius: 8px;
  margin: 30px 0;
}

.submission-guidelines h2 {
  margin-top: 0;
  color: #333;
}

.submission-guidelines h3 {
  color: #555;
  margin-top: 20px;
}

.submission-form-container {
  max-width: 700px;
  margin: 40px auto;
}

.submission-form {
  background: white;
  padding: 30px;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  margin-bottom: 8px;
  font-weight: 600;
  color: #333;
}

.form-group input[type="text"],
.form-group input[type="email"],
.form-group select,
.form-group textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 16px;
  font-family: inherit;
  box-sizing: border-box;
}

.form-group input[type="file"] {
  width: 100%;
  padding: 10px 0;
}

.form-group small {
  display: block;
  margin-top: 5px;
  color: #666;
  font-size: 14px;
}

.form-actions {
  margin-top: 30px;
}

.submit-button {
  background: #2a7ae2;
  color: white;
  padding: 12px 30px;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: background 0.3s;
}

.submit-button:hover {
  background: #1e5bb8;
}

.submit-button:disabled {
  background: #ccc;
  cursor: not-allowed;
}

.form-message {
  margin-top: 20px;
  padding: 15px;
  border-radius: 4px;
  display: none;
}

.form-message.success {
  background: #d4edda;
  color: #155724;
  border: 1px solid #c3e6cb;
  display: block;
}

.form-message.error {
  background: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
  display: block;
}

.form-message.info {
  background: #d1ecf1;
  color: #0c5460;
  border: 1px solid #bee5eb;
  display: block;
}
</style>

<script>
document.getElementById('submissionForm').addEventListener('submit', async function(e) {
  e.preventDefault();

  const submitButton = this.querySelector('.submit-button');
  const messageDiv = document.getElementById('formMessage');

  // Disable button and show loading state
  submitButton.disabled = true;
  submitButton.textContent = 'Enviando...';
  messageDiv.className = 'form-message';
  messageDiv.style.display = 'none';

  try {
    const formData = new FormData(this);

    // Update this URL to your deployed API endpoint
    const API_URL = 'https://futuroayerhoy-api.YOUR_SUBDOMAIN.workers.dev/api/submit-form';

    const response = await fetch(API_URL, {
      method: 'POST',
      body: formData
    });

    const data = await response.json();

    if (response.ok) {
      messageDiv.className = 'form-message success';
      messageDiv.textContent = '¡Gracias por tu envío! Hemos recibido tu obra y la revisaremos pronto. Te contactaremos por correo electrónico.';
      messageDiv.style.display = 'block';
      this.reset();
    } else {
      messageDiv.className = 'form-message error';
      messageDiv.textContent = data.message || 'Hubo un error al enviar tu obra. Por favor, intenta nuevamente.';
      messageDiv.style.display = 'block';
    }
  } catch (error) {
    console.error('Error:', error);
    messageDiv.className = 'form-message error';
    messageDiv.textContent = 'Error de conexión. Por favor, verifica tu conexión a internet e intenta nuevamente.';
    messageDiv.style.display = 'block';
  } finally {
    submitButton.disabled = false;
    submitButton.textContent = 'Enviar Obra';
  }
});
</script>
