function createArchiveLink() {
  var headers = document.querySelectorAll(".category-head");
  headers.forEach(function (header) {
  header.addEventListener("click", function () {
    var nextElement = header.parentElement.querySelector(".archive-items");
    if (nextElement.style.display === "block") {
      nextElement.style.display = "none";
      } else {
      nextElement.style.display = "block";
    }
    });
  });
}

function createCollapsableCode() {
  document.querySelectorAll('pre > code').forEach(function (codeBlock) {
    var codeText = codeBlock.textContent || "";
    var lineCount = codeText.split('\n').length;
    if (lineCount <= 5) return;

    // Create details/summary wrapper
    var details = document.createElement('details');
    details.className = 'collapsible-code';
    var summary = document.createElement('summary');
    summary.textContent = 'Show code';
    // Move the pre/code into the details
    var pre = codeBlock.parentNode;
    pre.parentNode.insertBefore(details, pre);
    details.appendChild(summary);
    details.appendChild(pre);
  });
}