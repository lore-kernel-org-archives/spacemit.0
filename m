Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CDB23507B
	for <spacemit@lists.linux.dev>; Sun, 17 May 2026 01:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778982562; cv=none; b=pR+myO4DMGOTqnvWq8H/fj1simGUyvWQl6sUS7OsNbAEm7ZMmmJ2nSQxarxO+RFvYsh7sLS4l5yhqdPuLwfj8Xq0Wsi7ENv46OF4I20MDefCuILf02Zt5JQzl9PlE5Q7M7TncsJClK3l3KK2P8Z7Qzxh4kJxgOuQ4tf1kJpJmLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778982562; c=relaxed/simple;
	bh=7xXazUW++/Ihl/B9YC+Gc9/dkyUHgTw/pMGMhxHIGmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MlDvASc/7nzUMC1GMv5DCFt3ybrXdcTpufQ39YYWF6L7ARDWgpeym+hX6ngj/6yV2iv//eswPNvrXKnfllOFERQtFEkUyxy+nFNlP8TOXWn8wqOfMf3Ch0SJ2tu7OxXH0gK2SlyhwTQMw1fjsYm9/463zjNi9NEGlxU1neH2Jzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ci/YpJ1+; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ci/YpJ1+"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c7980c060cfso407628a12.2
        for <spacemit@lists.linux.dev>; Sat, 16 May 2026 18:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778982560; x=1779587360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=soU3PERBuMP9kXvFqB8tDnXdMIQE2fWpQSLyN/x1tn8=;
        b=ci/YpJ1++mLLaODDrGKK5x5vBxqEaLq8lScyXN7PvmSbOCToprNSg6Bil2L6sbIJvW
         ZnAMD7MMyNfczJikNVUWhhuxyngRkFS3bWg0gehEqw3hCzPPBsCkohzDHllQG+7wfTqJ
         aOE88qiU/QdM2G0HouRV8W+kscEiYud5EX4aRQC5CORVo9scTszAvltoeRnz9Sbm+uRW
         zUm30CeHntZlOa1Nbij0z834Q8ODpK4rzazUyagSamZZpwvWHRM1MKqYSS4hrLJ6Y9zW
         5jH7OwhmBkIuK2N1rjbvra1YklC9bQRS2yYl+inK3TfTpgFBZESudHGbHyoOkiPwaN5U
         AjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778982560; x=1779587360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=soU3PERBuMP9kXvFqB8tDnXdMIQE2fWpQSLyN/x1tn8=;
        b=nQ4dObzt4AZ5uA7lno+twsINdGoq8zzmUFQpi7QMHNwZrfBU8yiMfwcma+6qJALVZK
         zMYoCtFlD+lFJl5YzCvNHlF0eq6a3zCXDDu9PJQ2Rl3Tpw3Hu2n/7KsJ77srAcz65xan
         qqGsPFr25EMUEJPPHR7slgAB7pKP8YdwPZ+zemdyo4bE+xjkVMEr0UD5PtDa5snI4X6V
         NkRLEvIcyAhaIs+mLaNL4hLUwqJJLexA0l3zJ4IvStMbdt68MpzDeIgImZObfTiyFjBc
         oHRVg37oDamQv78t1AcQUyfVwlZ3QI/VKQ2jNE/pgQV3JNFwr+11I91Gdnl2R0NFRXND
         ly1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ozvlsoe+Rn4It9ro9By1IUVjW6dRlSbVNSOTcTxyFJqp4gRPF/0vD1De4nDkczxqCbBrILeVEUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyN/Y743AunMkJ5+Xk6zI/W7w0rv0kUJ2Chk3/ZqHwFZfBP+JRj
	fUdXc0oJimZ/VmxbGYkvNGKLTuzMWayDKx0VtPgeO5NcWAqZB8LtO4xqtZvWdTWV
X-Gm-Gg: Acq92OGCXJQ5NBOuAPh91+kNJ9tubRmaXfkE2jCZ33cNJEdwDVbasVGTFxLdFT6zOtk
	8RsclM4hPmFqx+kqGdf83pDIh9qd5oTc7ajtWgnqMFp4G9/TNzPRT7eEYo5HRjjQFlzsXuMNR3I
	SW9zPhd05SDfgf4619LlnfLLzRNy2HBj3EyglKhVedv8CbQLuuqQP3RaUcSH8g9tEjhOIlIl6QP
	0p1ruFqdeccsVV3ooDi4O7sqqeptZpi1baO26Sx14mvvlS0DJiCHbawh629/uZqlgKDj3ID41J9
	M9mQ/2wllzLfUVU9OfBf5d06tPSd6REFqXhHe9gy2JfGxk8yH+eppsMCIu7K+79HiZBa8gCEX8p
	eUD106tKKKCP+qPB1hU1mEdox2VimGcdUCI4VfDKybHXpVgZ9c3Z+A8zKbjpj7jNLb2oDR6wwpH
	y9GuYH79fycGIRYUOflf/4o5w=
X-Received: by 2002:a05:6a00:a1b:b0:81e:f1c3:89df with SMTP id d2e1a72fcca58-83f33de1258mr9305811b3a.50.1778982559999;
        Sat, 16 May 2026 18:49:19 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19778ad1sm10531320b3a.17.2026.05.16.18.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:49:19 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Alex Elder <elder@riscstar.com>,
	Nam Cao <namcao@linutronix.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/5] PCI: spacemit-k1: Add multiple PHY handles support
Date: Sun, 17 May 2026 09:48:37 +0800
Message-ID: <20260517014841.254085-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517014841.254085-1-inochiama@gmail.com>
References: <20260517014841.254085-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe controller on Spacemit K3 may use multiple PHYs at the
same time. The feature is not support by the current driver.
So extend the PHY definition to support multiple PHY handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 1b519d49dcc0..7f6f1df31cd8 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -51,7 +51,8 @@
 
 struct k1_pcie {
 	struct dw_pcie pci;
-	struct phy *phy;
+	struct phy **phy;
+	int phy_count;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
 	u32 pmu_off;
@@ -171,7 +172,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	 */
 	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
 
-	ret = phy_init(k1->phy);
+	ret = phy_init(k1->phy[0]);
 	if (ret) {
 		k1_pcie_disable_resources(k1);
 
@@ -191,12 +192,14 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct k1_pcie *k1 = to_k1_pcie(pci);
+	int i;
 
 	/* Assert fundamental reset (drive PERST# low) */
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
 			PCIE_RC_PERST);
 
-	phy_exit(k1->phy);
+	for (i = 0; i < k1->phy_count; i++)
+		phy_exit(k1->phy[i]);
 
 	k1_pcie_disable_resources(k1);
 }
@@ -277,7 +280,12 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
-	k1->phy = phy;
+	k1->phy = devm_kmalloc_array(dev, 1, sizeof(*k1->phy), GFP_KERNEL);
+	if (!k1->phy)
+		return -ENOMEM;
+
+	k1->phy[0] = phy;
+	k1->phy_count = 1;
 
 	return 0;
 }
-- 
2.54.0

