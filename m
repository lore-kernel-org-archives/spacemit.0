Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1368F1917FB
	for <spacemit@lists.linux.dev>; Sun, 17 May 2026 01:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778982566; cv=none; b=HhZ4VzuGXt0zMdFo8G0Wkhg6FF8WySYbD285UktZFsVHFN8Al5uha2ZfXMJraolFBPwAkVYGdILf6CKQwKcariRRGZcfhw2AUW9RJy/0ksR7nRbJ27e+5ApnzEhcJd9vjdG0XELkBwDYaV3xpt5TADFUWZ061+zQ5+CpANbjFiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778982566; c=relaxed/simple;
	bh=0Oscz7/WLUKTye1b+R/+VWNQskuTvIsNTNGkBlIb80Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+OyRvTubY0z03eVrdDJnVXB4loLmu3Nm4gJFmhfbL49vQOzJF69z3WsLkzXD2BTwjfhnh6ZXBvljC6kdt+kn48X8456rrqleSaFNlA90tZNMsDi+F5QcKnZ+LTHWCX3YYLkC/ZUb1MaKAIQlnv9e7o2S1P9OvKRZCTo42PL5Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpwvkl5e; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpwvkl5e"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so389706b3a.0
        for <spacemit@lists.linux.dev>; Sat, 16 May 2026 18:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778982562; x=1779587362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBf3UIF6lGXHsknt4Ghf3Tw97w9Ex+KKpzto98h8Prs=;
        b=bpwvkl5exQQ+140242Dr6M/3WbmOJX/OA+4c+O6mbSdvLV8I86kICLpqZv1IHbRIe2
         WYuPALgmel06/97tYAgNCjiJBuORFR4sMfK1k2Fwms8kTtsy0wOhwR4VsU9osQDN/8n9
         sSWpnVpqnW8tWHjDiORxjE91rfGEne5XkgARQdu7fazewCrXC5sKZI5WTp4aQvW/7CpJ
         lpzl5mGvevE7Ewxl3ikTk3AkUCDVJyXWNxxc1fBIp4y1hl1B6D9RXy+qXhvR5El3gVM7
         sdPt7XobqKlnmwVUXmsmo+B9WThe3nUBckKdVlucfKDVGLRGypmkDCn1yE0PyX/Uv6xk
         WfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778982562; x=1779587362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pBf3UIF6lGXHsknt4Ghf3Tw97w9Ex+KKpzto98h8Prs=;
        b=fXJzGw8HeGPSZQIUCSMrcMouqdckiF+MmNsFy7iEZm2UxYrTWtWaKWzli9O9C0R2bN
         resV0Pxauq1NqgBnhHruR7ZHwnhqEYbvJVjS6oqXILGa0O4HRyHtpuJaQlF6tzIm5QvW
         Py6Z2iR1uqz/ygBay1q6e9NeMCM6ItgQY4kfFJkDwTivy0A0BBA2ayEHi4fkqneQOn+G
         fJJudpuS5k9F98trQI1ewWjjANK/3qa3LFyo9VdPiRJ7iDU+COQodiYqBFLWeY/pzeOJ
         jU/AFS+Npvim9jHrS/euWTDfuUDxbcXyaG6rhNw0+OUtGoDVI4PJBTP/v5LRRwqTbWbq
         kC/A==
X-Forwarded-Encrypted: i=1; AFNElJ9Ru9OiV0XUJ37gA1KPlMqOdg5Mq3WxeuEPDfMzaIrc9QA00m1gPN1Q1k4oZWmKXQ8WAA1mBaGr6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YysmWywId7W8Twhn8rVfdUisK4X704BDyIRF/PTEl8ETfO5Jgqo
	c63OMmgLJVzI0X/z32pGNpRjF4TwMUkwLh10Fin1bCRTyewWIovFtPRV
X-Gm-Gg: Acq92OGy3y6h1BVwJS/TwcuQwh+Dty53QwsqpG3Kj4nNzeG5zXxGz5BJg36enOs/c8t
	U5pclV7Upox2DvBBPth/FdV1aEagKBHhi3b3Whc5970fPA2Zz1nFIiLyHY0Afr8TBarn6LLDjqs
	oOt4gGfABuVZHL7gdMcxO/3k2OGDz5z3LLcY1Z4a6G6SFQJb+saabObn/DcR99VyjQwVIkqJT7j
	2Cncri+SVyckKQGlYbO/FbTJRv62LzG+SkgQmidbccIQaUk66CaPiaV3IBMXnFqZdnn/euGI6vv
	yDzDGoUJKSSYQoYYbm84UGKTjqLMGQ/ZvyX3c8n642RO05qgOCOjhn/NxqpxuL5eyZTJeyBLT5D
	pacWnP070dZ8pRm6PS68wZiKLPEDF+0WDi+6e6DLG2HgQvt644HAtkEJyYP0I+x25PUa9A5eeRx
	fFSNZXYok17pI4fDiyoqY17us=
X-Received: by 2002:a05:6a00:a20e:b0:82c:e1aa:21e3 with SMTP id d2e1a72fcca58-83f33bca81dmr10011080b3a.10.1778982562438;
        Sat, 16 May 2026 18:49:22 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cc8bsm10511314b3a.55.2026.05.16.18.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:49:22 -0700 (PDT)
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
Subject: [PATCH v2 3/5] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Sun, 17 May 2026 09:48:38 +0800
Message-ID: <20260517014841.254085-4-inochiama@gmail.com>
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
2.54.0

