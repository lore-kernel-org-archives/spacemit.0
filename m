Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815709;
	b=Fe4Hf3mlMrrGYWHqlsfYSEz15IPWoLoNje0t7s0sQ0MdtfFNIOdC338WeyV7FJ4H4RBD
	 shjp8Pu1PKO5i1A9dBKL4IIAY0wiyvTIkgmqGyRHwbYeTMcRSu0Ma9wOhz46Qc3C1pnwU
	 3nPS2hodXXNr5nGhXyX+TEg9evuDDmgHwT8muO4NpeauJW62BzaoQ2sWlZn3yFPconIsI
	 vLw6yPkSzbPeYwHahZ7zgskaCfzOGVuZlGKvAX7an+ouZJJ40isKux2xEMShSThhYC/Z0
	 E3YhVy5ftt0JvCAYFuXpOBdsw5j7WqeF4PsMnIO9Usjh0yea8qFij7ANZwKuVmhnYNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tk8pYgMhS/KMO5ZSGHCIBmeCagveRv5obJ7p1m6+Rcc=;
	b=ZJK13M75yRqxzYveym70MSV5UxMhcxcq+IgYUbrMHzItRZAVXrtDFfZsT5LrzCd2nKFA
	 NecCB0dKXwyZYBZEvKGjvmynNBEbwH1flvXa869287478bmCjj4DtFubjoyn0CrJ7DclL
	 iFyhbL5/R+hr9rf12KQiQ3MTBPUlKSH86XrS5yqU2NWvCvyk1sOlnyQMd2vPT+F+s/2cf
	 nkuKzW7V03y4mCgg/h8kRmITtTlucbhqKtJBbjcjXkkw6FOne/rcoBDz/FfuJnBoFFtM+
	 Mmj5CuQOmF3rDUHD+dLYhQ6tFA3nPfn2w97ZGBfGyd/TsSkfEtRiGMhIXxFdf2Bkicg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kMB0YLVO;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44330606A329
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 07:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44330606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kMB0YLVO
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3704d30b84fso3646611eec.1
        for <spacemit@lists.linux.dev>; Sun, 15 Nov 2026 23:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815708; x=1795420508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tk8pYgMhS/KMO5ZSGHCIBmeCagveRv5obJ7p1m6+Rcc=;
        b=kMB0YLVO/wogByXmZ77Svhcb2v3137CTHVTgPFm1HaQDomU7Tv2M09DhFDI4fBE+wI
         X2Gz7L0dO2pF1aiTHZOd/mtLRwAMM0UvfKfjaCo3sCOJMydMyLqvhDTzRTdNnoCT0DM6
         HO3q1zry/ganIS/0bamjO5wZhBjnVNTjj4dt3QrV721cPIpV7+akELyaAX292pdRL/2m
         pDvPdy3DDRQhJGEmcjOKoF0ulhatOQpbOPBFuzMp0iKvuSQAnrCc1zyBarrGNObZZmPf
         AUMcw0SVM2dOPqqnoKt9ywOK0vYIHb2lI7FzpXj01qNR4I75yTwbQmUWqA3qhp49ywFp
         +JtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815708; x=1795420508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tk8pYgMhS/KMO5ZSGHCIBmeCagveRv5obJ7p1m6+Rcc=;
        b=bK19Ysrm1otiFZ3rxFzNJezZIKr8GPuss2Uqf0Yop2rGuyVK0Qyi8nzmlx87bED+wI
         Tvj3wwORlHEaQ8xWIilyhiw5mA0kx78tVAd5IydDSNS5w0XibLQZ0XROnt5NP+ro6OqG
         +xpVq4mF592AZH38MFatlbNDPRgcgg97vFS1FNp1Ic+g2O1DaSm88sGx9XNJu2qPFkDN
         OyBlvG9KE1vHIRlTJpNljfmLcTC+7qMZGM/5iFWCRKUKvpU+hP++3Bv2A+ikOxiu5b0k
         6En7gGe0mlD5bitjTcdlr3BX/f01etvgJsRicjDk8amkJQ4rNWI8TDZdy5yoONaeFPtj
         xfIA==
X-Forwarded-Encrypted: i=1; AL+hErHviP4rmCnEr4r/dkCj/38h1sI6Gn8mvZciGYFDhnrszg7IRJV1K4bqbhqlQZCeVVZIrvKwvmbdqg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8WVIIrSYoWE2GbrvbtSc7DkGUVnI/AgdWvlR+KsWbheZI5hQfS
	+Rnp8JunhVkhviGB+8usLusjEHtca531urXI1J5XiDfKCINmVv5/MhOL
X-Gm-Gg: AYBFou18CbQceldT56PkTYBz1x03eDYbU11VZa1KXJZHp5Si5v/18UjL+A4qDLfChLQ
	47lk/EWh1b+DbnlsMV3isXCFlKBDcdq1Z3iTtq98WVAE9w7RAFjb1wfgLsh7xaOpyzsG8H9BNmM
	HFd+foI4LfyizizutWxGzTkA35I/wyXZYpVBENM5Hb0T6Ob+Op1aQoF4HI+TXHDOr/eQx/AMzCB
	EgBZ04O66Ov/JHRurA+Lra2uwkbUrwH8UZkMsrgBM1Y0cpyMrgpB95YZOo72gG3pUOberyC10gB
	R/bBwwsBn5zyz4zDZxZEO6z76H0umMXEuhxEvvVyn3O911vhg+z+csaRfeqim02vfUNrA3Q113x
	ZUDWS8SWJYTzmzp7h7x/2HXSRbD+9rD6bExKUAOn3zoQB2W/abPoSP3H6RSmPIIAYjlcS9F7ENE
	R1dlS7VyUSB29/vMiXh+KnPsXzyzZ7MXBDSw/5lkCt+Kv3J8Q5Kdk7mntZQs/TP7PoJmIl73jcF
	aWvXlYApwG3qAcaGp69V0ul7qNkMaCkwOp5uOUL8DdnxFH4XVwS557jnX1n7uJ2E40xOOl76O8K
	hQui62EXnSBu2DH0VPaTFZMb5DOHSmyS+mcpxtc1chVgSbw2UQHn
X-Received: by 2002:a05:7300:f694:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3796337436amr15249399eec.2.1794815708305;
        Sun, 15 Nov 2026 23:55:08 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm31398803eec.16.2026.11.15.23.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:55:07 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
Date: Mon, 16 Nov 2026 15:54:21 +0800
Message-ID: <20261116075423.1519438-2-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116075423.1519438-1-duge1256@gmail.com>
References: <20261116075423.1519438-1-duge1256@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the SpacemiT K3 eFuse controller and its readable bank 0 and
bank 7 shadow windows, which contain temperature calibration parameters
and other configuration data.

Define the AES_WTM clock and reset, little-endian data and
controller-relative NVMEM offsets. Use fixed-layout cells for the
temperature calibration parameters.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 .../bindings/nvmem/spacemit,k3-efuse.yaml     | 63 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml b/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
new file mode 100644
index 000000000000..93f4301c8289
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/spacemit,k3-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 eFuse controller
+
+maintainers:
+  - Jiayu Du <duge1256@gmail.com>
+
+description:
+  The K3 eFuse controller provides configuration and calibration data through
+  shadow registers. NVMEM uses little-endian data and controller-relative
+  offsets. Read access is limited to bank 0 (0x104-0x123) and bank 7 (0x190-0x1af).
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k3-efuse
+
+  reg:
+    maxItems: 1
+    description: The 0x400-byte eFuse controller register block.
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k3-clocks.h>
+    #include <dt-bindings/reset/spacemit,k3-resets.h>
+
+    efuse@f0702800 {
+        compatible = "spacemit,k3-efuse";
+        reg = <0xf0702800 0x400>;
+        clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+        resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            temperature-trim@19a {
+                reg = <0x19a 0x2>;
+                bits = <4 8>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46c416cadacd..0a9eb764ffee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26525,6 +26525,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
 F:	sound/soc/spacemit/k1_i2s.c
 
+SPACEMIT K3 EFUSE DRIVER
+M:	Jiayu Du <duge1256@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
+
 SPACEMIT RESET CONTROLLER DRIVER
 M:	Guodong Xu <docular.xu@gmail.com>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0

