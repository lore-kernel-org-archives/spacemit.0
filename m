Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9DF3655EA
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 01:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128285; cv=none; b=iKtkg34pCB9xT1FocapzX+OvmBBgmUH4hUzFP77tVZoiGJFlymWjbW4BCuU0SnFtvxODC+Q5Kh9FJMqayzA+78IEgeJHXQnJol57jJUvFt+vFTmDh8XZT6mGImB32KOUEZa10yBVgISDzQqPueLpxgPpsXzNBIaOlvUn/jfAkBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128285; c=relaxed/simple;
	bh=L3fsKyGi5rpLNg8G/ROz7kxtpDKTfFUi8q+A7hQ20Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXTkr/Qp81P6+QHU6Fm/vpLd5apm8H2YX97X/5C3CRRrNYzdaLjurnGGUmPnuU4WomJmOlhYtDQnxMzFqIjRis0hV7it/IA4P9QbHt1Jh+emZkhYDTnSJjKikPV6q+hT+NuIJvxsXKAGu0eGAR9zteAEkyEMO7dMdFLMVyEKs48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qxLRJSqq; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxLRJSqq"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1000064a12.0
        for <spacemit@lists.linux.dev>; Tue, 22 Sep 2026 18:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128283; x=1790733083; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=qxLRJSqqgfSBdBt7QqhEeFkTkHKMpQ6uSa9UdbpZwBYVCZOH9itX8IVtA4XkUrqHIU
         OnA6bINp3rK1v1AM0igsH/GdFCx1OE8/IzCJvOFkFQydSFeR1s34sLUWxrkagwK7DeZu
         ABM7CmZxT45vIYAP+3B72EditpTs2Oe5rroR8GsH6IZeEQQRX8/pyR9nAjCP1paP+yMb
         5/dBM+Dh7NPO3ho0ShJ7OBE51djC5+pvUHs990+AD3eNq42TsLPpGOEUP9Vh9cRtNHrO
         wHomgvXqFEuDyL5odCsh5gBSHy8PRxexueZgR0IUMs9CIHHY+L2YxLivdy7GvutqwkxS
         DZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128283; x=1790733083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=CLbv/On9soB2K22ETHGNVWT4fTFruHPn9RhOM3I2vU+lodqammOu9GAOHZthepiL8v
         /B0G3bDF2wb9p8Q5bkVrERAUkABG5bQozmfPcVqCychFWKNx/K1A3uFrPNch/99/JMEM
         jYqNHUscTjwDtkTTYxBLwhuVB+r9NQ3m8E5QTqMu7DPyMZbc+MygoQUTtQkqyLjMHZLP
         /IMl1zv8JeJtBhXk0P0n6CDlsGjkPPJgCwUMi4BiOXEZEPIJM6oYcV5ahK6+DDo1c4ij
         gHsOCH7zt3NnWBKl1husC8FNkus70Vef0cA+aqHWXx9S76/FuVXo674XDOELKytiE6YJ
         ZWUg==
X-Forwarded-Encrypted: i=1; AKwUvBwFLKrHYXU1zR6YtvgVfCziOkeDxaRfQWoEYPX4UUSbNs/hik+DdvjBRg3hl4MmCLVCQFvPU00CrA==@lists.linux.dev
X-Gm-Message-State: AFuF++kXZS2nxnBIYdF2EwAv6F6m2Iz21bd2b/8TnXasxWb32apqF6WS
	Td4kID2FC9NCHXin/8YhA2SgJnP9Q6FaJxMWwJ6GWP8kTOi6maEJyHs4
X-Gm-Gg: AYBFou0kp+aBeu2PIwZpMXsTUVCUIVFzYW5xefFrI2GZ/knbhHePpZd4Eq7O96dWmhg
	paUNmfOT+3HtSCOtDQNy92YIH/BCrDtGJCmYSmzGRo8cuup/hOZHqLmWLUXuY2Ag4FYSMyC1ffL
	zOEm+OXmTlaE07rCC6leXAI1+RN26hBSep7IhbAnA/a/Mvm5Iz5hzl3viBq0PFXKTKeya4Z0YhQ
	V0ms96joqGvLPkRSjORlDasteCxR6xZNWPEH1WNBFQ4Y476lQ2JMr7i4Eht7cfJdsYhBgdCcQKx
	P+PhtArmjB06C+Ns63kOuCcsHDn/o8sYA/vnLP18NaZHpYz4SbY5Is/SDvxcv1WyjfFzgsHbO4K
	zpX4/LZhBHCMR8c+5/LXWWj5ZEsA1C9qLjpaVDGBp5iJ4cAuhUVP6r/cbfB3zoBWdiy/eHkMFR6
	cYHO5I+AUtYCNMZEq0tHPeDEZpl91k/cgukLRQ/ydSo25krDk=
X-Received: by 2002:a05:6a21:4882:b0:3dd:85ba:ad4 with SMTP id adf61e73a8af0-3ddec8562ccmr2388263637.39.1790128282867;
        Tue, 22 Sep 2026 18:51:22 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3d67bbsm291074a12.13.2026.09.22.18.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:22 -0700 (PDT)
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
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vidya Sagar <vidyas@nvidia.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Wed, 23 Sep 2026 09:50:13 +0800
Message-ID: <20260923015016.64069-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923015016.64069-1-inochiama@gmail.com>
References: <20260923015016.64069-1-inochiama@gmail.com>
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

