Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E10B2517AF
	for <spacemit@lists.linux.dev>; Fri,  3 Jul 2026 02:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783044052; cv=none; b=UarjEhX1VCtx62Riu0lPtffHZUWOwE4DwQReVVybBeMRlY5INfSN+1EeVKx9L+wm3cYcUcHkFpVykoEx7oVXaRD8ZzV4TDkGiJrcDaLwrPnMx6XDwAEDu2tfOzREd42Df7DBPX4TSFNqVLOXq2pLXAzN2Bg7kJql1y9PoEUTKnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783044052; c=relaxed/simple;
	bh=L3fsKyGi5rpLNg8G/ROz7kxtpDKTfFUi8q+A7hQ20Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USJZXs8JHgWOsM1LH9C7XP2RDA8yha9yChgRO2bO+gg5JSner0rNk+vf4nt/vLWwxpWR04Z7ZPTWXiKMrL1wj10zYrNyy1yG9qXA+8GKzH/tEEi8kWlxD7s906hw9si7sKe1qAMHZ0II6ghxXYZ5pttOybahm+aQgJpgjf9v0+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgZQXHgk; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgZQXHgk"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c99672293cso331075ad.2
        for <spacemit@lists.linux.dev>; Thu, 02 Jul 2026 19:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044051; x=1783648851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=JgZQXHgkzi8t9CUoXbGSQ0JJuf+Vi69HnakzgslKJ/AgVuT+xG1PClxkH5uhHe8rZv
         jK0WJGTU9NqGByo8t/3SAtGlJtkoQWrJOPCXwJ7YZcuHYdqyYhir1ckNDFB4H3smPBek
         UaQc1e2pZlWISaRcoa1DADsvuknahmY6XIrsn7xnfoyKH4qNZ69V/8F5ORz6sG9CWKHj
         hZxF9khZ1pYZK6B8BWy6szckISmr1hHwfdv63rdkRexx9EXWEDtrtJZ1jV/ZnRmlmysK
         +37jpA6N/tAnILuYP6B6/hK2oIu6fFTX3hsC7YbLeLZ5bWzbd3jT1AgysRxc8mMqVNd6
         ShjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044051; x=1783648851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=YYjYQT7BhZcRfJew5jjgRyaC0m6LQK8M3AzZNwmStxeLimjMojjOfuRqdC7vsEkFoN
         V26BlC/qaJIH7XX8cetry6F9X/vMB86PI2Jy8lBQgMGgZ+1gA44KHdHhWg6YiaQsBBSx
         5V/2kUWIXGzINZpC9rsOPhDmPkGOTDERaj92wVaBtKKGbzDsI1aKoDuGQ2P8EHHhPTre
         TGwO8jL7wiM811gHea0H6m6HpQ6vH4/n7KlBbhmwFvIqstwFVG77Fr0SrWKGTtzK23oB
         OTxd13es9++yDfW3S0PkOgB79yqg715M0zvGGazWPJbfF9aOhMgxBhJn8jx03+j7botN
         oLcA==
X-Forwarded-Encrypted: i=1; AHgh+RpaFdqXeP6x0/WVBdmFdK/56i0xBMdIUfri9Jb/8z260ZVtHY4TgoYo2zUqVug2DsnrcIO3POSM1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyP8x7RafuhyPjOFymbzMelMGJlWXFlEV6j0AAt+lsGg82a+0aJ
	NegIDKA3ZGZEUmIdLE3M4cfgs6mOJvGQ+Zi0mquQ369IE/fAZXT83YIK
X-Gm-Gg: AfdE7clrE1N+JqVHpCkY0O6dZf+s41+1UR7OzNxGeySanUB26G9A/4jMiiCeuFaLADa
	KoNkQsFNnQLFT98RxR3zNAtDfgBagjw1APwlrbgXzAHtKLcqDuzgsI+orPTPAZqzpvUgQ9rUsk9
	hedojlhZMQ5g6CzzeJHytRCH9F4ymAQ9dzc/tPUq299vLeucqcJR3ABHudwYS+sXplbjkepCGpc
	naQuuofBZvtUFvjysKiifeyR1OTBoPChjxcaUOWEbtCzxDh7Hp9rdfbhb1xdEoBTQ86dky8aURM
	0/JUxlIgAGd1rXmp8JoU4/ICqKEuC4N3HH+KrgROm/s1e9pQvivc7OSyaiSbl9zmIBbZhP6IALx
	SbpqDGke21hZT4tbH2adPPEM03Ys5usMwjHa7kjpsKDgY5t0tK7XbhSbnfJGwcxzdIMjNv8sA6j
	eTxL50KDCAnSM=
X-Received: by 2002:a17:902:d541:b0:2ca:e5c:7fba with SMTP id d9443c01a7336-2ca7e87f1f5mr99029145ad.39.1783044050535;
        Thu, 02 Jul 2026 19:00:50 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad71458f6sm1481975ad.32.2026.07.02.19.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:50 -0700 (PDT)
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Fri,  3 Jul 2026 10:00:00 +0800
Message-ID: <20260703020003.485436-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703020003.485436-1-inochiama@gmail.com>
References: <20260703020003.485436-1-inochiama@gmail.com>
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

