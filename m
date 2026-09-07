Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D9E47987C
	for <spacemit@lists.linux.dev>; Mon,  7 Sep 2026 11:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780409; cv=none; b=uj2xWV9JIi/tgYOiejaYtAyepN/QESOU2g7P7ZnCwXuuf1XcxkfRPh0DvQDmG0JuqN3Gz0XOHJ0Xm11lqGt3r6nKSGbX9DCbSmi47XvYR5bZusKja9aUuY8/6+7lkdVY+vaTdde45WVbVfxpG1hu8wqd6AjdF/jcD2YIVnLizSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780409; c=relaxed/simple;
	bh=L3fsKyGi5rpLNg8G/ROz7kxtpDKTfFUi8q+A7hQ20Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YRUdLuySLMu60g7J7iyEleS2qsABg46o0r3kwyt7UF6JeR9EIHToRrLDBBE8kB05YPRWfpguhVe69UomLyaqEEAtnbXwGJYwr5MTxsI+ZKaVg9TpjuLfe22hAK2YIXQM6XcykAAGzABEFZWst1AUt0IMdKIq5xo0hP6tqiG3Jfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abxWKK1g; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abxWKK1g"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8541875f596so1218374b3a.0
        for <spacemit@lists.linux.dev>; Mon, 07 Sep 2026 04:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780407; x=1789385207; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=abxWKK1g0wnEH/AWw1/h+za6obk3prZkJBhYq+FCuAKS37bnanneqqMca5Y7mGqwPV
         /hd5kDlYWlXBP3yGzCSUvHZ27rcVTutv93uwiCwEzJ6L+BTZmnOCG0Dm+JW2ATo5dXIl
         tQ6qtkcjh2L4CpDb8BSeZBIQF3wpCl7kY+flWxARUevr6Hnt/aeWXhJkm6ub6azcfEqu
         zpDx/ZcKJbH4dDI1YFqo5pGXCQcM48nxHBqe/3Nm73zcu3rHoE2gIEXIE2RqaI95/26m
         IBIJIxXwGOux6Aefix0J889mZz5unhV5v/+cIk/l2a+5xI/oD92fg5tUN3rFpKkDw9SL
         KHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780407; x=1789385207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=arC+JNNkp6LumwLsZVPgUX6gVQ1bJ8TADJP/siltR2W4fLVjMu8J8Asj/+Zfk1un2F
         DyasEaAFxklzrSAA7VKk3kZzER7xiEORorXGUwKVvraq317CN10HWqUm6zVVitw5kMDv
         Lu/PYmVivmIjGiSAPz8ksrt0zaEyS4SGkO0+++pQQmBKMgQO89MC5TO4kquoltIPs1gs
         J4TwJHzMbAE/e1I60kqk7eHWjVL133OvlUbHunVaHiQckG92NxDa5npdbPrt7Rye+yoA
         lVCgL3iHf20pbOXEUh/nrYntYK7ItuE7AKed5nJKzGs39IrEtwKXSdv5XvrjA/mUcwqm
         jsAg==
X-Forwarded-Encrypted: i=1; AKwUvBzXAGz6dzHgWM3KTSg/KJV5+u3SOVtYPPoGpjfzT2fiSMI0CS6GwHG5jwIh89BKInbuSMF97hmBnw==@lists.linux.dev
X-Gm-Message-State: AFuF++kxXA9siDOcGwXG0Iq1WEMMLQg2WShN2kKa9FI9wsycVblauKB1
	Lyg3l/AHkKwCTWbQuYlgZiWkoMxPCFcqyZQnWZCOe0Md8wcFZ1954F0q
X-Gm-Gg: AYBFou0R8cnCE2qoXSs96dBmVol2VETdz/WxU71nhjKf0LEz+58oIlZ2K5UJ+9ZIa7H
	13HWntteeSGsLnMdFOGL9KSOmAtcHd0NKyyf80aG7ChLnYPnu2QboLhKybzISXTp3QHaN9tesWD
	FaLhrm+Dq6/AY8rvgWF+JXX9bu5gLogfDY4BAZSDLLPhTxG/Rf9SPfmIKFMGIWX/LkUwLEx31RL
	nFUFG4hsqaUiyYkYJmGsEm78+7aRRlJdC6dO75OSP2IOBB8fx6WwH9GwRdrWLwIrz/5RMU7VlUw
	8SJ6Tx0G3EjfLC7FNLh7S+8gnIJ/6Kx5fkHZKAQxfX23fiYOq+b3ncpnKbgTP2AQLyOsvuVRv1s
	Ef5rbNG2WoMwRSJeopO0DFNzxIR6ph9YNkv23feo5+vmGpyD20a3kZBbc4So61dDPYBMLUDsYGw
	x5G/Rj/ICZofdA3bsHV84t9EV/QrXmiZ2JsMh2
X-Received: by 2002:a05:6a00:32c4:b0:857:73e2:9107 with SMTP id d2e1a72fcca58-8616c8498dfmr29556641b3a.23.1788780406647;
        Mon, 07 Sep 2026 04:26:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045f67sm4265654b3a.18.2026.09.07.04.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Mon,  7 Sep 2026 19:26:03 +0800
Message-ID: <20260907112606.465778-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907112606.465778-1-inochiama@gmail.com>
References: <20260907112606.465778-1-inochiama@gmail.com>
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

