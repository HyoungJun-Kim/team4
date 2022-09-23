'use strict'

/*구매 내역 모달 컨테이너 */
const orderHistoryModalCon = document.querySelector('.orderHistoryModalCon');
/*구매 내역 디비전 */
const userOrderHistoryDiv = document.querySelector('.userOrderHistoryDiv');
/*리뷰 작성하러 가기 스팬 */
const writeReviewSpan = document.querySelectorAll('.writeReviewSpan');

writeReviewSpan.forEach((item) => {
    item.addEventListener('click', writeReview);
});
orderHistoryModalCon.addEventListener('click' , closeHistoryModal);
userOrderHistoryDiv.addEventListener('click' , openHistoryModal);


/*리뷰 작성하러 가기 함수 */
function writeReview(){
    location.href = 'review.html';
}
/*구매 내역 모달창 열기 함수 */
function openHistoryModal(){
    console.log('클릭');
    orderHistoryModalCon.style.display = 'block';
}
/*구매 내역 모달창 닫기 함수 */
function closeHistoryModal(e){
    if(e.target.className == 'orderHistoryModalCon')
        this.style.display = 'none';
}