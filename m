Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B75B34A78F
	for <spacemit@lists.linux.dev>; Thu,  9 Jul 2026 04:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569692; cv=none; b=YfWHXRxxS7HfUJWgkxD7wld/Ic8zucZRs1ne7ucqkrqDvuA+rqNmHOLderjYz/pj/PRb3B7oD405fKU7Lu1XoSjzjI0fsg1ZnA5PrFF7aqGLFrDo7SaHEFJQxKfUUlZ4pCq+MtYgy4d2g9mTSNV+kHomAg7zl0TGWSGc5fX2UG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569692; c=relaxed/simple;
	bh=L3fsKyGi5rpLNg8G/ROz7kxtpDKTfFUi8q+A7hQ20Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=npvIe5qlZgi15wYf5SEu7PMcxo1YsnpkmW/sT9HXiiKISO8MiwHSeHsHQm7tWaCQoFTWd0RvuqOZk0bxEj8DV75yMrYR3ykDg+yCqqUPSmD8Tg7BRSf6niv5IhwAc6uJ5a4zDjMu/op6Cx+LNJNaY7qWQvxjYoQkpK+yJ1gBxoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEHt5LhO; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEHt5LhO"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-848479c9bd5so1016883b3a.3
        for <spacemit@lists.linux.dev>; Wed, 08 Jul 2026 21:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569691; x=1784174491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=SEHt5LhOOM7JE3hng13Rj34szKGwBkc3D5kFrrK6ahpc+W3HgvcLHaBjcoa33dbYxg
         mIw+J3Ry+9Jqgyd+2JwR9KRwdo6JP3PPIm5jIInUnze/7N3NPbrvY4He2EocWsM2+DAm
         oj5BHkr1f8g70vkt+LIBBZ9T6HZLnyUN6/dCjbXXnwhO2x2mNNl7b9kvahtgyh4aUWbU
         amp/m5koGhVgF0S8EvR+/0DtTOetRMliy+0uWerkLG2stILRwz5Lp+XNdbmg6prJxAIh
         3DoAA2BKO27RAUcXz2M4fyLwNvEz5Iq111rrKxB76YgGcirPWv0QQrEVcQs/3m56YhVS
         gUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569691; x=1784174491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=r/rCS68Ox3Qs38geFUzU64f9+Z/kYhhqzPlVlCdVR2kXU7qdMcvuYoMGPwCAgUEiyA
         FcxzEzUPm5ZIIugrmKbqMs5qdE5/aqiwXjbTeTaHwbKRubpDrkaG3F0Ba+SXCVG9G5rf
         yyj6Zm30f0UfxDWYYFeL6CRxvHZ1jdYjQz+om/HvBSG3xemRebNzzjSnRuk+8p8TSdCS
         2RKGPcTs/MzF+pPoDigafWQLpcq28ZD8ASj/q8OU52H75xIZXMGAUIXGcsAFFJbzv6DN
         GT0Q9i/ZErbWwi92Eo+0zGcF4H1gzvxMBuQ2O741Aim/7K2vcO+8ibNsQETksi8yPImR
         Yy6g==
X-Forwarded-Encrypted: i=1; AHgh+Rrd2juwZKD+2S675wGDyMgPdjYtz5Hl3yd6iNMCzrXoDFmH6Be9eL3mPxvGSN/9L+zRQ+PJNcU5JA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh3BALDefyd93EJngG2p1thjpL/HFzpAolYOqNuQqjXWsK/+DM
	6p7RLFK4c/cMl9Xpfq+32GVV8kmgwsEv1Q70daSstrkf/7h+HGub7ZFM
X-Gm-Gg: AfdE7cm/Vwegg2h7cr7xMJyVltazW9Sq4gtGbCqeJ9rc2poev2FwXtf5SCPHb0B6PYv
	YVYkR4hmuYd240xASXynE970cIpSLXcz+F9baJCKL8fuCQzWkvD5rcRscaGkWJDSuW5vD1wgCKw
	aCl8xof0Argur+IPZr4CdxcpmuPVK0ZQpDlqdWy0fblJucNB75GDYFD6FrbOJifSI4Xd+mm36PL
	eCxPSfMePdOhpJ/I4l0LP3/NeghNq8Ev9LxsTrRHBkP09gurq2KJP0vV+Rif48yGVZPakgqwahg
	QaTbvhr/gS9HQ1N10ylerAXy0601pCBWQv4KrHKF9g+LFM09TNBc7LmQnYJVs3ZLjpNKgpOV5+x
	gulWM+Md1cVehCsTUKiat0e9knzjfMQFckd8Wfo2MnwWvPWxhlWt65NXggIlMpno+
X-Received: by 2002:a05:6a00:c88:b0:847:881c:7026 with SMTP id d2e1a72fcca58-84842eb7ef9mr4875368b3a.3.1783569690624;
        Wed, 08 Jul 2026 21:01:30 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b93f8csm8273199b3a.19.2026.07.08.21.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:01:30 -0700 (PDT)
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
	Christian Bruel <christian.bruel@foss.st.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Nam Cao <namcao@linutronix.de>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
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
Subject: [PATCH v4 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Thu,  9 Jul 2026 12:00:24 +0800
Message-ID: <20260709040027.958400-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709040027.958400-1-inochiama@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMSIC device on RISC-V based system does not require ID
remapping for MSI. So this device only needs "msi-parent"
property for IMSIC-based SoC, and the "msi-map" is not a
necessary property.

Add new condition for MSI handling on IMSIC based SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index b3216141881c..91bbbc8924f6 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -27,8 +27,11 @@ allOf:
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
   - if:
       not:
-        required:
-          - msi-map
+        anyOf:
+          - required:
+              - msi-map
+          - required:
+              - msi-parent
     then:
       properties:
         interrupt-names:
-- 
2.55.0

