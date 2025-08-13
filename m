Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94302C0307
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 18:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755110834; cv=none; b=sG2X8ttKgxZegSe+l7K6v/VDbK9Fub6nEU6r4WIHfywwOl73NF5z8xGb5ndLGOb4rSuSiiMF+et6b04qrhYVYc6pdHsvp1aXiYHrNsKMWKridNz4C7urfgh9+Ru9Vyh+QV8t5A3p4tky3OGULdhk/ehEb1frgyVZESWG7lwvUCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755110834; c=relaxed/simple;
	bh=ObVTQfTP6WmVdXDTlQq2ihRv1LL2FrZFdRYiGHsi+L4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThbTXY+NW4hweBUzLPL+e+LzAaYhg0DgCQvaKzdI/m8rIaNmeamp69pwmVc0Mzz0dN7JQGCmsecLQec/oxSYR3O4I1kF1F8aby1wLi16Bu6HiDsA6eRbBBm+128taYPxVCrAe5R1IrQc+w0dWGf6r+tyF64Jr1zw4ahusvVh7Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ZPrqq3FC; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ZPrqq3FC"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3e56ffcec58so1084075ab.1
        for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 11:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755110831; x=1755715631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3anfg9B6GDnUStv+H7P2Qqm8t3EB0LsOUKal4iU9hMY=;
        b=ZPrqq3FCbjWwcQdeEAbebS0lfofW9T4O9hEpQqZC4OOkSBpKwBOd/ds7HLIxArF19J
         DW9IlTxl4UZYI6aPzv6ydH2DWMp5ieP1xYh9rc6k5hVoyUm6r8hn0iTU1XW8XuaZrqIP
         DyXN2jMh1yInllnadT+MhTMdrgp7538JysY7n0PNSiBRlyIoWCfhEvYxtVERi/Iwhpy7
         GPxmyY+cSHD/2BjuDFbp1rxxdVuzIjmCl3uF0acoq/u3ue2Jl9E3yHrQsWj1ng8Ct2gk
         Ot9pdJtzhjiZILT30ORcHBMQ780PhmVDRRXJu53O9QehaZ4VeS+doDzRPC4TZyCiuo7u
         pOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755110831; x=1755715631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3anfg9B6GDnUStv+H7P2Qqm8t3EB0LsOUKal4iU9hMY=;
        b=i7KQLOvFpF/RLtic8n9S9Rjtkup7BCYGci31Y1HUXz0At8dg/KuzM6zGH/5TAqIlBp
         XTUWoEf2py/7sZ3dpnsBfqndoAJpXIeCKaCjCi5oYk/feUvoLHym1R3qJegv8nCvoIB/
         9pD+t/A/hXaPMa+7Gm84Fm4XQBkZtoYGq8ycI5ungpjyzSS759whxKoeu6BJy3x1BJe0
         uaV74bry4zaCNjlDzQCpWv+iZScGE5EeLzoJqApt1p0NSI4LBsUQo2+msVSeTCCtBhqp
         JwP2UgWEFV5RLQQp1kYUniM4FqPM+D2iaXX8yT1NSzIh6BOnHs8wkCxiqOQ7DfNNFLdc
         rAzA==
X-Forwarded-Encrypted: i=1; AJvYcCWd+m89q1RWh0nowyn3jpHPbjwnU2lIsAL2/Sz2/6h1ruoqcpG4A7IzIrsYp9hJprwOvyQXhMTIrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YykeBxqzQtrnIR0HDWNU0fMxG2RTthImRT26Gjl5xJYQBfHNJ6h
	hP+IH7NJtDQMrgxDdJxjuS43ZeD+xVhkVJxagJD5r9VBIiH6dmYhqOkdASFfUP++tVw=
X-Gm-Gg: ASbGncuPkioK7R/GdnJ52okvix9quh4GYofRWYjE7XwIqPdkJMx3qniPqjXeeRvDbWW
	ZdSYhF8mE72uDTGOqKFiaih23jFDgHe/2WX3UbwhK/6NWnyaP/qsK7UbOYBmdNnVA4lu6tAoT5N
	In03QgP9rcOs82tb2V31o37d2YiBwrvGK9eKWEcrVxNfkkFdxSfvQaiGqnl41JOS9tlG5vRJmRb
	PYmM4e3dL8LVEOWIUR/jed1RQ6umzLCUdqHsJlEwYvD2vVq26YE1+VgwBpUC/iEBb0D6ruLiryx
	lNV55uplbdVgSwctSUxYsKTelYs7J8EXr/xKKxSj+n/TJ/npE7WrPD1+AqVGw8oO/rlQyntO7Iw
	na1Y06LhWnVf10NhjUBg8/9Wtk+TxTdK4/y1Ms7qKVANdELKt9N61of1mlPbLGKJt4g4eyp8hjr
	qg
X-Google-Smtp-Source: AGHT+IHqcfmnRrUjdAlNWmje55A9T53WMKx9lEOXpWePQCsQDSmAhiGvxZUCa4A2bLPkAxx42qtLRg==
X-Received: by 2002:a92:c24e:0:b0:3e5:4a4c:2ed0 with SMTP id e9e14a558f8ab-3e570964fa7mr4127025ab.24.1755110830847;
        Wed, 13 Aug 2025 11:47:10 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bd89d7sm3933104173.59.2025.08.13.11.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 11:47:10 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	tglx@linutronix.de,
	johan+linaro@kernel.org,
	thippeswamy.havalige@amd.com,
	namcao@linutronix.de,
	mayank.rana@oss.qualcomm.com,
	shradha.t@samsung.com,
	inochiama@gmail.com,
	quic_schintav@quicinc.com,
	fan.ni@samsung.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: phy: spacemit: introduce PCIe PHY
Date: Wed, 13 Aug 2025 13:46:56 -0500
Message-ID: <20250813184701.2444372-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813184701.2444372-1-elder@riscstar.com>
References: <20250813184701.2444372-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Device Tree binding for two PCIe PHYs present on the SpacemiT
K1 SoC.  These PHYs are dependent on a separate combo PHY, which
determines at probe time the calibration values used by the PCIe-only
PHYs.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/phy/spacemit,k1-pcie-phy.yaml    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
new file mode 100644
index 0000000000000..b0cbd231d9378
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k1-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PCIe PHY
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+
+description:
+  There are two PHYs on the SpacemiT K1 SoC used for PCIe (only).
+  These PHYs must be configured using calibration values that are
+  determined by a third "combo PHY".  The combo PHY determines
+  these calibration values during probe so they can be used for
+  the two PCIe-only PHYs.
+
+  During normal operation, the PCIe port driver is responsible for
+  ensuring all clocks needed by a PHY are enabled, and all resets
+  affecting the PHY are deasserted.
+
+properties:
+  compatible:
+    const: spacemit,k1-pcie-phy
+
+  reg:
+    items:
+      - description: PHY control registers
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    pcie1_phy: phy@c0c10000 {
+        compatible = "spacemit,k1-pcie-phy";
+        reg = <0xc0c10000 0x1000>;
+        #phy-cells = <0>;
+        status = "disabled";
+    };
-- 
2.48.1

