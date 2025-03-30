<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simulador de Crédito - Bancolombia</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            max-width: 650px;
            margin: 0 auto;
            padding: 20px;
            color: #333;
            background-color: #f7f9fc;
        }
        
        .header {
            background-color: #004884;
            color: white;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 25px;
            text-align: center;
        }
        
        h1 {
            margin: 0;
            font-size: 28px;
        }
        
        .subtitle {
            margin-top: 10px;
            font-size: 16px;
            opacity: 0.9;
        }
        
        .calculator {
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #004884;
        }
        
        input, select {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e6ed;
            border-radius: 6px;
            font-size: 16px;
            transition: border 0.3s;
        }
        
        input:focus, select:focus {
            border-color: #004884;
            outline: none;
        }
        
        .range-container {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-top: 10px;
        }
        
        .range-container input[type="range"] {
            flex: 1;
            padding: 0;
        }
        
        .range-value {
            min-width: 80px;
            text-align: center;
            font-weight: bold;
            color: #004884;
        }
        
        .btn {
            background-color: #004884;
            color: white;
            border: none;
            padding: 14px 25px;
            font-size: 17px;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            font-weight: 600;
            margin-top: 15px;
            transition: background-color 0.3s;
        }
        
        .btn:hover {
            background-color: #003366;
        }
        
        .results {
            background-color: white;
            border-radius: 10px;
            padding: 0;
            margin-bottom: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            overflow: hidden;
        }
        
        .option {
            padding: 25px;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .option:last-child {
            border-bottom: none;
        }
        
        .option-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .option-title {
            font-size: 19px;
            color: #004884;
            margin: 0;
        }
        
        .emoji {
            font-size: 24px;
            margin-right: 12px;
        }
        
        .amount {
            font-size: 18px;
            margin: 12px 0;
        }
        
        .highlight {
            color: #004884;
            font-weight: bold;
        }
        
        .fee {
            font-size: 22px;
            margin: 15px 0;
            color: #004884;
            font-weight: bold;
        }
        
        .total-cost {
            background-color: #f8fafc;
            padding: 12px 15px;
            border-radius: 6px;
            margin: 15px 0;
            font-size: 15px;
        }
        
        .interest-rate {
            display: inline-block;
            background-color: #e6f0fa;
            color: #004884;
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 600;
            margin-top: 8px;
        }
        
        .links {
            margin-top: 15px;
        }
        
        .link {
            color: #0073ce;
            text-decoration: none;
            display: inline-block;
            margin-right: 15px;
            font-size: 14px;
            transition: color 0.2s;
        }
        
        .link:hover {
            color: #004884;
            text-decoration: underline;
        }
        
        .request-btn {
            background-color: #004884;
            color: white;
            border: none;
            padding: 16px 30px;
            font-size: 18px;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-weight: 600;
            transition: background-color 0.3s;
        }
        
        .request-btn:hover {
            background-color: #003366;
        }
        
        .hidden {
            display: none;
        }
        
        .error {
            color: #d9534f;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>BANCOHOLANDA🌎</h1>
        <p class="subtitle"> Crédito de Libre Inversión</p>
    </div>
    
    <div class="calculator">
        <div class="form-group">
            <label for="loanAmount">Monto que deseas solicitar (mínimo $1,000,000):</label>
            <input type="number" id="loanAmount" placeholder="Ej: 1.000.000" min="1000000" max="200000000" value="1000000">
            <div class="range-container">
                <input type="range" id="loanAmountRange" min="1000000" max="20000000" step="100000" value="1000000">
                <span class="range-value" id="loanAmountValue">$1,000,000</span>
            </div>
            <p id="amountError" class="error hidden">El monto debe estar entre $1,000,000 y $200'000.000</p>
        </div>
        
        <div class="form-group">
            <label for="loanTerm">Plazo (12 a 74 meses):</label>
            <input type="number" id="loanTerm" placeholder="12 a 74 meses" min="12" max="74" value="24">
            <div class="range-container">
                <input type="range" id="loanTermRange" min="12" max="74" step="1" value="24">
                <span class="range-value" id="loanTermValue">24 meses</span>
            </div>
            <p id="termError" class="error hidden">El plazo debe estar entre 12 y 74 meses</p>
        </div>
        
        <button class="btn" onclick="calculatePayments()">CALCULAR CRÉDITO</button>
    </div>
    
    <div id="results-section" class="hidden">
        <div class="results">
            <div class="option">
                <div class="option-header">
                    <span class="emoji">⚡</span>
                    <h3 class="option-title">Tasa fija - Cuota fija</h3>
                </div>
                <p class="amount">Por un crédito de: <span class="highlight" id="fixedAmount">$1,000,000</span></p>
                <p>Pagarás <span class="highlight" id="fixedTerm">24</span> cuotas mensuales de:</p>
                <p class="fee" id="fixedFee">$48,000</p>
                <div class="total-cost">
                    <p>Total a pagar: <span id="fixedTotal">$1,152,000</span></p>
                    <p>Interés total: <span id="fixedInterest">$152,000</span></p>
                    <span class="interest-rate" id="fixedRate">Tasa: 12.5% EA</span>
                </div>
                <div class="links">
                    <a href="#" class="link">Tasas y tarifas</a>
                    <a href="#" class="link">Plan de pagos</a>
                </div>
            </div>
            
            <div class="option">
                <div class="option-header">
                    <span class="emoji">⚡</span>
                    <h3 class="option-title">Tasa variable - Cuota fija</h3>
                </div>
                <p class="amount">Por un crédito de: <span class="highlight" id="variableFixedAmount">$1,000,000</span></p>
                <p>Pagarás <span class="highlight" id="variableFixedTerm">24</span> cuotas mensuales de:</p>
                <p class="fee" id="variableFixedFee">$49,500</p>
                <div class="total-cost">
                    <p>Total a pagar: <span id="variableFixedTotal">$1,188,000</span></p>
                    <p>Interés total: <span id="variableFixedInterest">$188,000</span></p>
                    <span class="interest-rate" id="variableFixedRate">Tasa: 13.0% EA</span>
                </div>
                <div class="links">
                    <a href="#" class="link">Tasas y tarifas</a>
                    <a href="#" class="link">Plan de pagos</a>
                </div>
            </div>
            
            <div class="option">
                <div class="option-header">
                    <span class="emoji">⚡</span>
                    <h3 class="option-title">Tasa variable - Cuota variable</h3>
                </div>
                <p class="amount">Por un crédito de: <span class="highlight" id="variableAmount">$1,000,000</span></p>
                <p>Pagarás <span class="highlight" id="variableTerm">24</span> cuotas mensuales aproximadas de:</p>
                <p class="fee" id="variableFee">$54,000</p>
                <div class="total-cost">
                    <p>Total estimado a pagar: <span id="variableTotal">$1,296,000</span></p>
                    <p>Interés estimado: <span id="variableInterest">$296,000</span></p>
                    <span class="interest-rate" id="variableRate">Tasa: 15.5% EA</span>
                </div>
                <div class="links">
                    <a href="#" class="link">Tasas y tarifas</a>
                    <a href="#" class="link">Plan de pagos</a>
                </div>
            </div>
        </div>
        
        <button class="request-btn">SOLICITAR ESTE CRÉDITO</button>
    </div>

    <script>
        // Función para formatear números como moneda
        function formatCurrency(value) {
            return '$' + value.toLocaleString('es-CO');
        }
        
        // Función para calcular el pago mensual
        function calculateMonthlyPayment(amount, term, annualRate) {
            const monthlyRate = annualRate / 100 / 12;
            const payment = amount * (monthlyRate * Math.pow(1 + monthlyRate, term)) / (Math.pow(1 + monthlyRate, term) - 1);
            return payment;
        }
        
        // Función para calcular el interés total
        function calculateTotalInterest(monthlyPayment, term, amount) {
            return (monthlyPayment * term) - amount;
        }
        
        // Función principal de cálculo
        function calculatePayments() {
            // Obtener valores del formulario
            const amount = parseFloat(document.getElementById('loanAmount').value);
            const term = parseInt(document.getElementById('loanTerm').value);
            
            // Validar entrada
            const amountError = document.getElementById('amountError');
            const termError = document.getElementById('termError');
            
            let isValid = true;
            
            if (isNaN(amount) || amount < 1000000 || amount > 200000000) {
                amountError.classList.remove('hidden');
                isValid = false;
            } else {
                amountError.classList.add('hidden');
            }
            
            if (isNaN(term) || term < 12 || term > 74) {
                termError.classList.remove('hidden');
                isValid = false;
            } else {
                termError.classList.add('hidden');
            }
            
            if (!isValid) return;
            
            // Mostrar sección de resultados
            document.getElementById('results-section').classList.remove('hidden');
            
            // Tasas de interés (ejemplo)
            const fixedRate = 12.5; // Tasa fija anual
            const variableFixedRate = 13.0; // Tasa variable cuota fija
            const variableRate = 15.5; // Tasa variable cuota variable
            
            // Calcular pagos mensuales
            const fixedPayment = calculateMonthlyPayment(amount, term, fixedRate);
            const variableFixedPayment = calculateMonthlyPayment(amount, term, variableFixedRate);
            const variablePayment = calculateMonthlyPayment(amount, term, variableRate);
            
            // Calcular totales e intereses
            const fixedTotal = fixedPayment * term;
            const fixedInterest = calculateTotalInterest(fixedPayment, term, amount);
            
            const variableFixedTotal = variableFixedPayment * term;
            const variableFixedInterest = calculateTotalInterest(variableFixedPayment, term, amount);
            
            const variableTotal = variablePayment * term;
            const variableInterest = calculateTotalInterest(variablePayment, term, amount);
            
            // Actualizar la interfaz
            document.getElementById('fixedAmount').textContent = formatCurrency(amount);
            document.getElementById('fixedTerm').textContent = term;
            document.getElementById('fixedFee').textContent = formatCurrency(Math.round(fixedPayment));
            document.getElementById('fixedTotal').textContent = formatCurrency(Math.round(fixedTotal));
            document.getElementById('fixedInterest').textContent = formatCurrency(Math.round(fixedInterest));
            document.getElementById('fixedRate').textContent = `Tasa: ${fixedRate}% EA`;
            
            document.getElementById('variableFixedAmount').textContent = formatCurrency(amount);
            document.getElementById('variableFixedTerm').textContent = term;
            document.getElementById('variableFixedFee').textContent = formatCurrency(Math.round(variableFixedPayment));
            document.getElementById('variableFixedTotal').textContent = formatCurrency(Math.round(variableFixedTotal));
            document.getElementById('variableFixedInterest').textContent = formatCurrency(Math.round(variableFixedInterest));
            document.getElementById('variableFixedRate').textContent = `Tasa: ${variableFixedRate}% EA`;
            
            document.getElementById('variableAmount').textContent = formatCurrency(amount);
            document.getElementById('variableTerm').textContent = term;
            document.getElementById('variableFee').textContent = formatCurrency(Math.round(variablePayment));
            document.getElementById('variableTotal').textContent = formatCurrency(Math.round(variableTotal));
            document.getElementById('variableInterest').textContent = formatCurrency(Math.round(variableInterest));
            document.getElementById('variableRate').textContent = `Tasa: ${variableRate}% EA`;
        }
        
        // Configurar sliders
        document.getElementById('loanAmountRange').addEventListener('input', function() {
            const value = this.value;
            document.getElementById('loanAmount').value = value;
            document.getElementById('loanAmountValue').textContent = formatCurrency(parseFloat(value));
        });
        
        document.getElementById('loanAmount').addEventListener('input', function() {
            const value = this.value;
            document.getElementById('loanAmountRange').value = value;
            document.getElementById('loanAmountValue').textContent = formatCurrency(parseFloat(value));
        });
        
        document.getElementById('loanTermRange').addEventListener('input', function() {
            const value = this.value;
            document.getElementById('loanTerm').value = value;
            document.getElementById('loanTermValue').textContent = value + ' meses';
        });
        
        document.getElementById('loanTerm').addEventListener('input', function() {
            const value = this.value;
            document.getElementById('loanTermRange').value = value;
            document.getElementById('loanTermValue').textContent = value + ' meses';
        });
        
        // Calcular al cargar la página si hay valores válidos
        window.addEventListener('load', function() {
            const amount = parseFloat(document.getElementById('loanAmount').value);
            const term = parseInt(document.getElementById('loanTerm').value);
            
            if (!isNaN(amount) && !isNaN(term)) {
                calculatePayments();
            }
        });
    </script>
</body>
</html>