Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DD7311944
	for <spacemit@lists.linux.dev>; Mon, 22 Sep 2025 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557846; cv=none; b=KcOEeMWYDuqO+cYXk3EpackrBP+HBHHuH6goeyXCJh2fMEiQCy0sGoLiyDp3VT9JGuEq3dQxp+WHegotOpk9W/CmELh+Rrsy4En/6jOvwvXJ/dPt5F0dhkR7rjNtp4j9wfva5HAo2cmdNxk7IOAnYi8hiIq851ixTExaoqNzx0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557846; c=relaxed/simple;
	bh=edCRzSVTiYPJ0Iq/9l/vZR4EeBvsYuqnxRx4p4KIrD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5LnAGLsOalApWOIwV4OofQL89TZcd6NDq64HudK5/mjoe9/ArMaS7lPiQzj1mvmVnT0zRHB3kdEidxep1XOm5GfFauWwDlF83dykjDTk6P1gi+O2sswR2DTbNj5B5ewd6lXjqyX/2aA8541X1Drn762XIKmhcd4obXIDLjbwwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Bt4LpAzN; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Bt4LpAzN"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-89365bbc079so115856139f.0
        for <spacemit@lists.linux.dev>; Mon, 22 Sep 2025 09:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758557843; x=1759162643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wga3pOieT58b7cDMHJFs+GN/WnPHhePS4hUJ36fp+DA=;
        b=Bt4LpAzNEX3Xsozfl6EkMdivBuTmqQrENXQ/psLYkQoUKY/5Y0ILcCfjaDYvPhtCgU
         7dmG1NENnU1g9QtWi7QxuF8pAMfbxzNBm3YazXeLGr88sEHnx7RWWqy0JriCWpNZ+apf
         RmP5ZOm+I/TedFe80jXHT4defdF/JyWEGCVINEM8F0lY3t/mbpj7jOfRYRR1z63qgVow
         QqVFHSGagebSfTsHmoc7L8nGcLGuU5vcthjqZYqZasj4UKQ414xWNR9eHkoEKFmdDAvv
         E0cCz5pzn4dj3XSAEFsnsSIBvcUGTobJNel5Fi8lL7DNJy6yL1JQBUZA7vV/hTAvLwvY
         ZqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758557843; x=1759162643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wga3pOieT58b7cDMHJFs+GN/WnPHhePS4hUJ36fp+DA=;
        b=RELUQ6Hh0JOjkh1WxtjSOUZlgKHMGgha1AD6WC1pl1q6VZECQuemG0CcQTisYHhHCz
         3iwlNx0Xt0DSrs7bZyb7zLUj5z/FfSV5wt4zd0/TEb9tJibY7C8xbnq/ajsJqRXSvCii
         ZSli3UM4eLmBXcqvm1mVjusTqz83uzLzZTtfvJ/5KEekDsCSh4tNnOrjyWaXNaqLqz50
         Z3wtmWv3uHZRH/PsNjvp694cWFebBcIYljArtu40z0DQUM6Rpnpmkf91gEwFvl4qLfqd
         8zifmow8FnFg51XjtoQyLUI5D7s+vSacek11d9xMJT64T1MdK4mcdBu5Nt7CVixHNOAT
         tdDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSyVAtxMxuYxLQsh3uYo1Hdfc9FPBGQtqIHCMj5CLWCijjsE4yh9cf5FbgdQd2usOJpjQQfFS0ow==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyhv7sd4otKhNZuuVvBjSCrMsRKZiRRZkrvhbLt4PxiIq4u/jFM
	N5Q4Ls7tUcZnzww0TgcKwJEaJdBzPw8gV0RY0hRnvrQnrspdvhs1BET1nmYmrcZZags=
X-Gm-Gg: ASbGncvsPr06ayxRJyG7pPvF6bUMGeMNH9MdxrNkx7UWm6wp1jpywWeRLjMxVtP4oGq
	xY0GFFfoHMqAsZhTKMswurttVo1g7lwlUWTJ7xmAeEDJs9uWq2tKCqxw4yfjv7o0Z0tyJb7O6Sp
	KK3Emen15HsODvbYtDHuelGJOLaN+5Yyx9axsso9BFVW9JPnNcPd9hk+aTyRNh0iW9uIBlojXT9
	T9zTtl2uCuzOaDYUHmxhkbQVDktjBW9eO5VaT1glEmvd/ryHxirw8O1A/cq1pB4I13FYJfWnBzw
	bDe5KurmbcvN9fx8dEgG5ph23MtBapo6AGMZBx44yMkPrWkZCv9FRv28P2Z9Co+IcuEL7j2m/H7
	cYCLAj43rY5bJMeM58TjkkdhJIarsMRqJHWriPlon0f+jMN7Zfirr/G/4ADqrpWcH5fKWLD2f2s
	6I
X-Google-Smtp-Source: AGHT+IFNEIkWwdlkmnsrsDiii/iS29yCgoX4Tp67gfiF8B5e/yODsUx/VWOVNEk4pntvfOCoXkV5mw==
X-Received: by 2002:a05:6e02:1a82:b0:424:5970:3d20 with SMTP id e9e14a558f8ab-4248190bd99mr219210245ab.12.1758557843518;
        Mon, 22 Sep 2025 09:17:23 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425711d9aa0sm25207185ab.48.2025.09.22.09.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 09:17:23 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Date: Mon, 22 Sep 2025 11:17:14 -0500
Message-ID: <20250922161717.1590690-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250922161717.1590690-1-elder@riscstar.com>
References: <20250922161717.1590690-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the SPI controller implemented by the SpacemiT K1 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Add Conor's Acked-by
    - Add Rob's Reviewed-by

 .../bindings/spi/spacemit,k1-spi.yaml         | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
new file mode 100644
index 0000000000000..a6978212ff570
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SoC Serial Peripheral Interface (SPI)
+
+maintainers:
+  - Alex Elder <elder@kernel.org>
+
+description:
+  The SpacemiT K1 SoC implements a SPI controller that has two 32-entry
+  FIFOs, for transmit and receive.  Details are currently available in
+  section 18.2.1 of the K1 User Manual, found in the SpacemiT Keystone
+  K1 Documentation[1].  The controller transfers words using PIO.  DMA
+  transfers are supported as well, if both TX and RX DMA channels are
+  specified,
+
+  [1] https://developer.spacemit.com/documentation
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-spi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: Bus clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: RX DMA channel
+      - description: TX DMA channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    spi@d401c000 {
+        compatible = "spacemit,k1-spi";
+        reg = <0xd401c000 0x30>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&syscon_apbc CLK_SSP3>,
+                 <&syscon_apbc CLK_SSP3_BUS>;
+        clock-names = "core",
+                      "bus";
+        resets = <&syscon_apbc RESET_SSP3>;
+        interrupts = <55>;
+        dmas = <&pdma 20>,
+               <&pdma 19>;
+        dma-names = "rx",
+                    "tx";
+    };
-- 
2.48.1

