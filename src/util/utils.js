export function debounce(callback, waitMS) {
  let handle = null;
  delayed();

  return delayed;

  function delayed() {
    clearTimeout(handle);
    handle = setTimeout(callback, waitMS);
  }
}