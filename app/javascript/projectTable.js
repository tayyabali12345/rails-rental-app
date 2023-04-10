const table1Btn = document.getElementById('table1-btn');
const table2Btn = document.getElementById('table2-btn');
const table1 = document.getElementById('table1');
const table2 = document.getElementById('table2');

const showTable1 = () => {
  table1.style.display = 'table';
  table2.style.display = 'none';
  table1Btn.classList.add('active');
  table2Btn.classList.remove('active');
};

const showTable2 = () => {
  table2.style.display = 'table';
  table1.style.display = 'none';
  table2Btn.classList.add('active');
  table1Btn.classList.remove('active');
};

showTable1();

table1Btn.addEventListener('click', showTable1);

table2Btn.addEventListener('click', showTable2)
