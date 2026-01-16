---
layout: default
title: Contact Us
---

{% if lang == 'en' %}
{% assign prefix = '/en' %}
{% else %}
{% assign prefix = '' %}
{% endif %}

# [ 💬 Contact Balbina Safari ]

We are always ready to provide professional consultation and bespoke services for your Tanzania Safari trip.

---

## 📞 Quick Contact

<div class="contact-quick">
  <div class="contact-item">
    <div class="contact-icon">📧</div>
    <div class="contact-info">
      <h3>Email</h3>
      <p>info@balbinasafari.com</p>
      <span class="contact-note">Reply within 24 hours</span>
    </div>
  </div>

  <div class="contact-item">
    <div class="contact-icon">💬</div>
    <div class="contact-info">
      <h3>WeChat</h3>
      <p>baba-leo</p>
      <span class="contact-note">Scan to add</span>
    </div>
  </div>

  <div class="contact-item">
    <div class="contact-icon">📱</div>
    <div class="contact-info">
      <h3>WhatsApp</h3>
      <p>+255653486509</p>
      <span class="contact-note">Instant communication</span>
    </div>
  </div>
</div>

---

## 📝 Online Inquiry Form

<div class="contact-form-container">
  <form id="contactForm" class="contact-form">
    <div class="form-row">
      <div class="form-group">
        <label for="name">Name *</label>
        <input type="text" id="name" name="name" required placeholder="Your full name">
      </div>
      <div class="form-group">
        <label for="email">Email *</label>
        <input type="email" id="email" name="email" required placeholder="Your email address">
      </div>
    </div>

    <div class="form-row">
      <div class="form-group">
        <label for="phone">Phone</label>
        <input type="tel" id="phone" name="phone" placeholder="Your phone number">
      </div>
      <div class="form-group">
        <label for="wechat">WeChat ID</label>
        <input type="text" id="wechat" name="wechat" placeholder="Your WeChat ID">
      </div>
    </div>

    <div class="form-group">
      <label for="package">Interested Package</label>
      <select id="package" name="package">
        <option value="">Select a package (optional)</option>
        <option value="budget-northern-3day">Budget Northern Circuit 3-Day</option>
        <option value="classic-northern-5day">Classic Northern Circuit 5-Day</option>
        <option value="family-adventure-6day">Family Adventure 6-Day</option>
        <option value="luxury-northern-7day">Luxury Northern Circuit 7-Day</option>
        <option value="honeymoon-serengeti-zanzibar-8day">Serengeti + Zanzibar 8-Day Honeymoon</option>
        <option value="kilimanjaro-7day-serengeti-3day">Kilimanjaro 7-Day + Serengeti 3-Day</option>
        <option value="migration-special-10day">Migration Special 10-Day Tracking</option>
        <option value="ultimate-tanzania-14day">Ultimate Tanzania 14-Day Grand Tour</option>
        <option value="custom">Custom Itinerary</option>
      </select>
    </div>

    <div class="form-row">
      <div class="form-group">
        <label for="travel-date">Planned Travel Date</label>
        <input type="month" id="travel-date" name="travel-date" placeholder="Select month">
      </div>
      <div class="form-group">
        <label for="travelers">Number of Travelers</label>
        <select id="travelers" name="travelers">
          <option value="">Please select</option>
          <option value="1">1 Person</option>
          <option value="2">2 People</option>
          <option value="3-4">3-4 People</option>
          <option value="5-6">5-6 People</option>
          <option value="7-10">7-10 People</option>
          <option value="10+">10+ People</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label for="budget">Budget Range (USD per person)</label>
      <select id="budget" name="budget">
        <option value="">Select budget (optional)</option>
        <option value="500-1000">$500-1,000 (Budget)</option>
        <option value="1000-2000">$1,000-2,000</option>
        <option value="2000-3000">$2,000-3,000 (Mid-range)</option>
        <option value="3000-5000">$3,000-5,000 (Premium)</option>
        <option value="5000+">$5,000+ (Luxury)</option>
      </select>
    </div>

    <div class="form-group">
      <label for="message">Your Requirements *</label>
      <textarea id="message" name="message" rows="5" required placeholder="Please describe your travel needs, preferences, or questions in detail..."></textarea>
    </div>

    <div class="form-group checkbox-group">
      <label class="checkbox-label">
        <input type="checkbox" id="newsletter" name="newsletter">
        <span>Subscribe for travel news and offers</span>
      </label>
    </div>

    <button type="submit" class="submit-btn">Submit Inquiry</button>

  </form>
</div>

---

## ⏰ Operating Hours

<div class="business-hours">
  <div class="hours-item">
    <div class="hours-label">Beijing Time</div>
    <div class="hours-time">14:00 - 22:00</div>
  </div>
  <div class="hours-divider">|</div>
  <div class="hours-item">
    <div class="hours-label">Tanzania Time</div>
    <div class="hours-time">09:00 - 17:00</div>
  </div>
</div>

<div class="response-time">
  <span class="response-icon">⚡</span>
  <span class="response-text">We promise to reply to all inquiries within 24 hours</span>
</div>

---

## 📍 Office Address

<div class="office-address">
  <h3>Tanzania Headquarters</h3>
  <p>Arusha, Tanzania</p>
  <p>45 minutes from Kilimanjaro International Airport (JRO)</p>
</div>

---

## 💡 Pre-consultation Checklist

To make our consultation more efficient, we suggest preparing the following information:

1. **Travel Date**: Planned month and duration
2. **Number of Travelers**: Number of adults and children
3. **Budget Range**: Target budget per person
4. **Interests**: Wildlife focal points or specific activities
5. **Special Needs**: Dietary restrictions, health conditions, or anniversaries

---

[🏠 Home]({{ site.baseurl }}{{ prefix }}/) | [📦 Browse Packages]({{ site.baseurl }}{{ prefix }}/packages/)

<style>
  .contact-quick {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
    margin: 30px 0;
  }

  .contact-item {
    background-color: #161b22;
    border: 1px solid #30363d;
    padding: 25px;
    border-radius: 6px;
    text-align: center;
    transition: transform 0.2s ease, border-color 0.2s ease;
  }

  .contact-item:hover {
    transform: translateY(-5px);
    border-color: #58a6ff;
  }

  .contact-icon {
    font-size: 48px;
    margin-bottom: 15px;
  }

  .contact-info h3 {
    color: #ff7b72;
    margin-bottom: 10px;
    font-size: 16px;
  }

  .contact-info p {
    color: #c9d1d9;
    font-size: 14px;
    margin-bottom: 8px;
  }

  .contact-note {
    color: #8b949e;
    font-size: 12px;
  }

  .contact-form-container {
    background-color: #161b22;
    border: 1px solid #30363d;
    padding: 30px;
    border-radius: 6px;
    margin: 30px 0;
  }

  .contact-form {
    max-width: 800px;
    margin: 0 auto;
  }

  .form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
    margin-bottom: 20px;
  }

  .form-group {
    margin-bottom: 20px;
  }

  .form-group label {
    display: block;
    color: #ff7b72;
    margin-bottom: 8px;
    font-weight: bold;
    font-size: 13px;
  }

  .form-group input,
  .form-group select,
  .form-group textarea {
    width: 100%;
    padding: 12px;
    background-color: #0d1117;
    border: 1px solid #30363d;
    border-radius: 4px;
    color: #c9d1d9;
    font-size: 13px;
    transition: border-color 0.2s ease;
  }

  .form-group input:focus,
  .form-group select:focus,
  .form-group textarea:focus {
    outline: none;
    border-color: #58a6ff;
  }

  .form-group textarea {
    resize: vertical;
    min-height: 120px;
  }

  .checkbox-group {
    margin-bottom: 20px;
  }

  .checkbox-label {
    display: flex;
    align-items: center;
    cursor: pointer;
    color: #c9d1d9;
    font-size: 13px;
  }

  .checkbox-label input[type="checkbox"] {
    width: auto;
    margin-right: 10px;
  }

  .submit-btn {
    background-color: #238636;
    color: #fff;
    border: none;
    padding: 15px 40px;
    border-radius: 4px;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.2s ease;
    width: 100%;
  }

  .submit-btn:hover {
    background-color: #2ea043;
  }

  .business-hours {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 20px;
    background-color: #161b22;
    border: 1px solid #30363d;
    padding: 20px;
    border-radius: 6px;
    margin: 30px 0;
  }

  .hours-item {
    text-align: center;
  }

  .hours-label {
    color: #8b949e;
    font-size: 12px;
    margin-bottom: 5px;
  }

  .hours-time {
    color: #58a6ff;
    font-size: 16px;
    font-weight: bold;
  }

  .hours-divider {
    color: #30363d;
    font-size: 24px;
  }

  .response-time {
    text-align: center;
    background-color: #238636;
    color: #fff;
    padding: 15px;
    border-radius: 6px;
    margin: 20px 0;
    font-size: 14px;
  }

  .response-icon {
    font-size: 20px;
    margin-right: 10px;
  }

  .office-address {
    background-color: #161b22;
    border: 1px solid #30363d;
    padding: 25px;
    border-radius: 6px;
    margin: 30px 0;
  }

  .office-address h3 {
    color: #ff7b72;
    margin-bottom: 15px;
    font-size: 16px;
  }

  .office-address p {
    color: #c9d1d9;
    margin-bottom: 8px;
    font-size: 13px;
  }

  @media (max-width: 768px) {
    .form-row {
      grid-template-columns: 1fr;
      gap: 15px;
    }

    .business-hours {
      flex-direction: column;
      gap: 15px;
    }

    .hours-divider {
      transform: rotate(90deg);
    }
  }
</style>

<script>
  document.getElementById('contactForm').addEventListener('submit', function(e) {
    e.preventDefault();
    alert('Thank you for your inquiry! We have received your message and will reply within 24 hours.');
    this.reset();
  });
</script>
