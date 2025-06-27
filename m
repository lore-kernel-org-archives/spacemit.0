Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A292E2664
	for <spacemit@lists.linux.dev>; Fri, 27 Jun 2025 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034197; cv=none; b=kJJWq/LcYFoM2i7prevLYyAA/4tCN8pGQJxPDaMBPIuLIES7vBwPXq7hk0G6WAsXDBGr0nP8gYuVvQalw7IH453RPiq4wypsEIcnOnknYJ5+hUhiOgE0lDypOa1f5cj1iNCDWXAe5beAVmy/VEJqJ222mRBN/JF/ln49xWkCh/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034197; c=relaxed/simple;
	bh=vOyqrRqZ0tqkG6pWDO83ynGQRzYnD7v6m7LspWqpQ1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bb8qqKjyqjTk1+u/wIcAkEm+k8ysqP0WHdj3UL9ijzayPaJWHavKZLAKnZuMlKZ1fZbd7OdBWWyBW2XXFI7LbW9E3tX7qnug15ux5+8wqZj7/PeyTuVmgrwzRz/MXMAerXPGf8uvUeGliRSizu2LE7d6WgPXyzALyBdu9zcRv94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=BE6uCGsE; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="BE6uCGsE"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5b8d13f73so229948885a.0
        for <spacemit@lists.linux.dev>; Fri, 27 Jun 2025 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034194; x=1751638994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riR2NvFzHSo1w0g4tV+4jS0ZXA7bNFeHnroyUa7Novo=;
        b=BE6uCGsEd+TxSRRT94OwuCa71mOkrvayMqace/Kk2EwyNx/xq+Z4e8c1mmqQhYM5J5
         gXvU+9Xc81WBPADH7bOn6SAKIi0z1z+FNwV45jt0RtvZC3IczeKnqYwjdwE38ezHWK0n
         LnvWfAmn3y7BHsAk5LclcEbJHIQdQCLKlY1ILrLAQQ1Dh1luRal0zgevn6kdG3HdxTv7
         giyP29N9ojwmWH+t00X0u42zoAiP4MDsHdHfbdurLpOr/nznMC+9Yh+5A0g2WXsi0nvo
         pTMRB1TDxqFnzAn2xZw4OSPO0SsdafuduVmmbVL1WfYdxvU2MjZZyuvtmK/eJmLjn/tJ
         lbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034194; x=1751638994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riR2NvFzHSo1w0g4tV+4jS0ZXA7bNFeHnroyUa7Novo=;
        b=SO0OGVAIR0JaswnNxvwsEHW68cYSRBVS0dfo2JmHrPPKaP80o5vrAO2lRb8N7esV8N
         kKjYPpCnKpD3I88tZvk6eBoAYce05Dq6utqzHBihzv8jjD41HM7n/0/unWHw4TxA8Keg
         WG6OTddYhCKU8k23aq71wWCaPcpZVfEmhxyqA0EkQhqckNXng7phoGiSZe7Cd81aD2Yl
         pzsVyxuBQMO4FAdphg8UITX1nL1TnogKp/GPdwjRdGiCjnNrVzwlhFHqlOmZUP9BALbD
         Rv1v4OSYOo/LdZlUvhFcPyLAgmZPFYk8G4QQR8qBzI3R5Z7Roo7irBdIHGxPbutlwaaU
         4DRw==
X-Forwarded-Encrypted: i=1; AJvYcCW3Zr1bwRkE489DAm1PBONr7vAfcsglgU6OCx8bZ41KuQf2s2KYfRhUxrKPlGmWqpIfD27Buo53PA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAt7nPO20zKgJCZhF7joJRf+AHJHJdi3uf8ytfk1FiJEoZRXDp
	dayOkBSaAnSJ2uGHA0/v7uEXRZS0Z1aVzdE/BYp7ZkHbxeJZPLR7scs3ShdZpBVn5S0=
X-Gm-Gg: ASbGncsDMErPLEAePzL+RkgAqTEHowVLrYzFNyVmNDHpZM3GTH9Z1RDyRuQZH6vkLnw
	XHRjxY+TsMVXsMzX3LmgIe4JzIKUs1Hm/bTJf+0umb4j8u8aDr4Kbsgch7ad8IgVP5OFxc2cnL3
	msIOs5W2Sy1Q67/IGaUj3Lou09B/6zOUpLnLrhmiY58RkRB7atO6WshglVK3CPkeEPZkqKlTgji
	O8hzJBau4J1a3Ph8F3/FWeGKdS8GL5RQI7PSEQA/E+PDcFTDqoC5B+3Cw5r0nX4Jq9P+Nk5CjBq
	jvAu53R0frtDXHnA6pBOzO6Tgw/kTq9O6oaKEqvnl9FlOIQWD/U7JLctoPlJxqGy9DGW8aEvF3E
	ONLO0OMoEvnPtmr9jO4/Ypfzn8urJrFEVESQ=
X-Google-Smtp-Source: AGHT+IFt3w8KBQHmUinwLlL1S6ACJgjHlzpbWyZ0LJDc8hDP+5NLFg8sIB0fDMXq9nh17vsNn8bIaA==
X-Received: by 2002:a05:620a:2809:b0:7d2:18a1:ce0 with SMTP id af79cd13be357-7d4439c5607mr583492485a.49.1751034193763;
        Fri, 27 Jun 2025 07:23:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:13 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/8] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Fri, 27 Jun 2025 09:23:00 -0500
Message-ID: <20250627142309.1444135-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially
only the RTC and regulators will be supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v6: - Add Rob's reviewed-by tag

 .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
new file mode 100644
index 0000000000000..5cc34d4934b54
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/spacemit,p1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT P1 Power Management Integrated Circuit
+
+maintainers:
+  - Troy Mitchell <troymitchell988@gmail.com>
+
+description:
+  P1 is an I2C-controlled PMIC produced by SpacemiT.  It implements six
+  constant-on-time buck converters and twelve low-dropout regulators.
+  It also contains a load switch, watchdog timer, real-time clock, eight
+  12-bit ADC channels, and six GPIOs.  Additional details are available
+  in the "Power Stone/P1" section at the following link.
+    https://developer.spacemit.com/documentation
+
+properties:
+  compatible:
+    const: spacemit,p1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vin-supply:
+    description: Input supply phandle.
+
+  regulators:
+    type: object
+
+    patternProperties:
+      "^(buck[1-6]|aldo[1-4]|dldo[1-7])$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@41 {
+            compatible = "spacemit,p1";
+            reg = <0x41>;
+            interrupts = <64>;
+
+            regulators {
+                buck1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3450000>;
+                    regulator-ramp-delay = <5000>;
+                    regulator-always-on;
+                };
+
+                aldo1 {
+                    regulator-name = "aldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+
+                dldo1 {
+                    regulator-name = "dldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+            };
+        };
+    };
-- 
2.45.2

