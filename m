Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED91F47F2E3
	for <spacemit@lists.linux.dev>; Tue, 29 Sep 2026 08:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671100; cv=none; b=PSz3vLZdwjmHoql9xeGzaIwY1rCmJoUMRATEzqnG9gtJXhsiCc0XQig4q3wjjwrMm0gNlp0mdaVSoxG48LIgKfXK+/alTmZ8S8wWfAZxrIgsEGdq6/WWYCY6n9gr/h85xYE8c4B74A8rIJey4Oa6szuqoKOSbY01T2cbTPa/yCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671100; c=relaxed/simple;
	bh=L3fsKyGi5rpLNg8G/ROz7kxtpDKTfFUi8q+A7hQ20Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Df6UNXApF64N4fbt+uy/j2BXy1cuAFeYdhHVIklEG7DxVseiIUBJa3k/raIrWYEWvP7YJgvnk8TsM1S/HoNs6OCRUHz7lX3I1xbRHa9iy9sTfLKkSBvWHT7nFNB84R6iBtz3jz0Bkw1wbhquLu7i8ubDOUV/c5DT9ABbYfpdjv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SH3mluto; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SH3mluto"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0aa9d356eso3080356a91.0
        for <spacemit@lists.linux.dev>; Tue, 29 Sep 2026 01:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671098; x=1791275898; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=SH3mlutoGAAhTB5yRKSnAq1w1PlMzttkDgnnvfwV4nAJiDS/tc3SCQ8a5jQYdv60R5
         C1QcKz4TOpJnN87l6p5E6+y/fzEZpCzO83plbeRR2BCZFZUcfhlgu3Yj5GGAlkAAscSQ
         d8nLxSR6Q0ylk7ozT2s/Oq6Ob51apN43U552K/yMHwn60GOfl1gyAUz6DHTFcLF3nNB4
         /a8b+b71CXqAadbCYYMXtSKSrM9uxeHRXMxxRuwTZ/TpFumyS33U9FgUAJ8KHjREEDdw
         yfXM0NghQxUBq8cRqCnC7f3KKQdUr1b57E4Q4IUt+3alqpYsjE3msVgNlAn+4xRS3CKT
         +E3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671098; x=1791275898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=KIYHvasKVRADmMF3oP9IK0CK3W8XUUhhoZyE4F9+85Vq0fysilvzfTvObMK0+jHyUz
         DprTQ/8DILBNsD9b9iS/bdwARVNCU7PMpv6YdsrlShnuPFScRgWCyjnBz0lQHawYfAT9
         OShtxjoK5SzrCkxHs6MsB628Ys4Toju3t64S7rngFtdwXuTH+T3MyStnAE6cvYcgm3RY
         ckCXZ10BSrHAHlYWAVpoNy09Dr+nEqAIDNuqSmbOPEWbcE6XBdsiVtay8uUmokwzBbH7
         mwiGa+O6+ZAlgEPwduQ9TTTW66PvfV4AqWHR9aX4xYccZhX12BMxC3AKokwRx96feXcR
         UxMw==
X-Forwarded-Encrypted: i=1; AKwUvBzwRZ4ajm7dORN/+KFkvI0YTpzh4F0CkRmu8ntFgJao/PUmDhJGcOdHdugqkhaf/I69WkYllfmokg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLxfE188iOB9j0NYrIhXFbae20+1Px7cPttFJXAVmr+p1KzqpEi
	CRqfonFR7+47pQKHX1+BD/8e0IltNuruz4QLu5UnWUcEpAdlLp0ZEEeS
X-Gm-Gg: AYBFou26tgGQXp7pYjKDlIJpOZT1IzGHk+zOAKuuo5wIlIDr0oq6yST+JoKEG72xTJb
	A0Yinxudsc9c6ppqWKAztO1xcF8Rqy0otdyBJN3RmEJKkjVqdc3D03rHB7xNtzNcK+GHuyHen7y
	QGjTcJVp1lOL5h552u0R1Wr1Eo0Jj5TeO62MTc1p+VDLej4B689k0aMePodqHTBrfKWRcJUZk45
	WcqSUEAAZgZVfYbYbL1Zr5YUZ01StUN3SrGdCoae9E3obQt7MlJw6Cwmmr5QMkuB3K8szirWVwr
	i5f5qVgRHr0Rv/zWWdtqsoDQj7PtmqoiLpDNXgjvJ+hOI5APyG6LeAH7nXSgiFocHInW3IAJmNh
	rySPJy82um6Uan8x5iuL+AXztyphmnyLgY6mizwYi3GNCYkjcmbECTiTO4NpeLi7DduT6UTjj5X
	D/NLDObnWtT2VAfsMBJOQekE9h/1sYwOh7T99CvQKA4IA5pU/zgNTNHS/0vErEuvbt3wk4
X-Received: by 2002:a17:90b:2251:b0:3a0:9640:8031 with SMTP id 98e67ed59e1d1-3a098d4364cmr12391254a91.8.1790671098293;
        Tue, 29 Sep 2026 01:38:18 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7a3b8d70csm3751988a12.9.2026.09.29.01.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:17 -0700 (PDT)
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
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
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
Subject: [PATCH v7 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Tue, 29 Sep 2026 16:37:50 +0800
Message-ID: <20260929083755.458238-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929083755.458238-1-inochiama@gmail.com>
References: <20260929083755.458238-1-inochiama@gmail.com>
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

