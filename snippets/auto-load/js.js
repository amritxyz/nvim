var hell = document.querySelector("nav");

// Font color
hell.style.color = "white";

// Mouse over
hell.addEventListener("mouseover", function () {
	hell.style.backgroundColor = "green";
});

// Mouse out
hell.addEventListener("mouseout", function () {
	hell.style.backgroundColor = "red";
});

hell.innerHTML = "VOID";

const name = "void";
const age = 18;
console.log(`My name is ${name} and i am ${age} years old.`);
