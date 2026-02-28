# PI-GRUPO8-SEMESTRE3
Projeto Integrado - Terceiro semestre - Modulo Desenvolvimento de Sistemas Móveis


# 📦 Contador de Peças de Produção – PackBag
## 📌 Sobre o Projeto

Este projeto consiste no desenvolvimento de um sistema automatizado de contagem de peças utilizando um sensor infravermelho, um ESP32 e um display LCD 16x2, com o objetivo de auxiliar a empresa PackBag, fabricante de bags, no controle de sua produção.

O sistema realiza a detecção automática dos cortes de uma máquina de corte de alças durante o processo produtivo, exibindo a contagem em tempo real.

## 🏢 Empresa Beneficiada

A PackBag é uma empresa especializada na fabricação de bags para diferentes finalidades.
Durante o processo de produção, há a necessidade de controle preciso da quantidade de peças produzidas.

## 🚨 Problema

Atualmente, o processo de contagem pode ser:

- Manual
- Sujeito a erros
- Sem controle em tempo real
- Dependente de conferências posteriores
- Isso pode gerar inconsistências no estoque e retrabalho.

## 🎯 Objetivo do Projeto

Desenvolver um sistema simples, eficiente e de baixo custo capaz de:

- ✅ Detectar automaticamente a contagem das alças
- ✅ Realizar a contagem em tempo real
- ✅ Exibir o total produzido em um display LCD
- ✅ Reduzir erros humanos
- ✅ Melhorar o controle da produção

## 🛠️ Componentes Utilizadas

- LCD16x2
- Sensor/receptor infravermelho E18-D80NK
- Potenciômetro B10K
- DOIT ESP32 DevKit V1
- 1 Resistor de 1K
- Placa de ensaio

## 📋 Backlog Inicial (Rascunho)

🔹 Épico 1 – Estrutura do Sistema

 Configuração do microcontrolador

 Implementação da leitura do sensor infravermelho

 Criação da lógica de contagem

🔹 Épico 2 – Interface de Exibição

 Integração com LCD 16x2

 Exibição da quantidade em tempo real

 Implementação de função de reset

🔹 Épico 3 – Controle e Confiabilidade

 Tratamento de ruído no sensor

 Testes de precisão

 Validação em ambiente real

🔹 Épico 4 – Expansão com IA (Futuro)

 Implementação de modelo preditivo de produção

 Análise de desempenho diário

 Sugestão automática de metas

## 👨‍💻 Equipe

- Augusto Barreto Gomes Alves RA: 2500011
- Mateus Graçadio Coelho RA: 25000217
- Pedro Henrique Breda Domingues RA: 25000578
- Felipe Grossi Pereira RA: 25000473
- João Vitor Zamai Martins RA: 25000783
