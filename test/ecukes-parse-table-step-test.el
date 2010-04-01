(ert-deftest parse-table-step-all-good ()
  (let* ((step (ecukes-test-parse-step "table-all-good.feature"))
         (table (ecukes-step-arg step))
         (header (ecukes-table-header table))
         (rows (ecukes-table-rows table)))
    (should (equal "Given these meals:" (ecukes-step-name step)))
    (let ((hamburger (nth 0 rows))
          (pizza (nth 1 rows)))
      (should (equal "meal" (nth 0 header)))
      (should (equal "price" (nth 1 header)))
      (should (equal "Hamburger" (nth 0 hamburger)))
      (should (equal "$4.50" (nth 1 hamburger)))
      (should (equal "Pizza" (nth 0 pizza)))
      (should (equal "$5.30" (nth 1 pizza)))
      (should-be-table-step step))))

(ert-deftest parse-table-step-wrong-indentation ()
  (let* ((step (ecukes-test-parse-step "table-wrong-indentation.feature"))
         (table (ecukes-step-arg step))
         (header (ecukes-table-header table))
         (rows (ecukes-table-rows table)))
    (should (equal "Given these meals:" (ecukes-step-name step)))
    (let ((hamburger (nth 0 rows))
          (pizza (nth 1 rows)))
      (should (equal "meal" (nth 0 header)))
      (should (equal "price" (nth 1 header)))
      (should (equal "Hamburger" (nth 0 hamburger)))
      (should (equal "$4.50" (nth 1 hamburger)))
      (should (equal "Pizza" (nth 0 pizza)))
      (should (equal "$5.30" (nth 1 pizza)))
      (should-be-table-step step))))

(ert-deftest parse-table-same-row ()
  (let* ((step (ecukes-test-parse-step "table-same-row.feature"))
         (table (ecukes-step-arg step))
         (header (ecukes-table-header table))
         (rows (ecukes-table-rows table)))
    (should (equal "Given these meals:" (ecukes-step-name step)))
    (let ((hamburger1 (nth 0 rows))
          (hamburger2 (nth 1 rows)))
      (should (equal "meal" (nth 0 header)))
      (should (equal "price" (nth 1 header)))
      (should (equal "Hamburger" (nth 0 hamburger1)))
      (should (equal "$4.50" (nth 1 hamburger1)))
      (should (equal "Hamburger" (nth 0 hamburger2)))
      (should (equal "$4.50" (nth 1 hamburger2)))
      (should-be-table-step step))))


(ert-deftest parse-table-row-step-all-good ()
  (let* ((row "| first | second | third |")
         (list (ecukes-parse-table-row row)))
    (should (equal "first" (nth 0 list)))
    (should (equal "second" (nth 1 list)))
    (should (equal "third" (nth 2 list)))))

(ert-deftest parse-table-row-step-whitespace ()
  (let* ((row "    |     first |    second     | third |    ")
         (list (ecukes-parse-table-row row)))
    (should (equal "first" (nth 0 list)))
    (should (equal "second" (nth 1 list)))
    (should (equal "third" (nth 2 list)))))