Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D517B407581
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464434; cv=none; b=rCjts0pmlUtOnTkJNGEUr/NxEn6q3LhK2JrVRavFiUsE/H968hf7tXC4E8PhR+pjMd1cp5Tqv+b/ub+370WJ/7xNZg4bDqK/PrhgiVhNYaVm5RDuFzIL9uy1mEBuGRLIPQ2ZIdOMAQ4H4Tz7Tff61qd4E5YgLqJhE4g6GeA26oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464434; c=relaxed/simple;
	bh=exV6OpyIj+E7YmJqvnw7Yw8GsUS9yk0uhliZbbcVwO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZEdNWChx+8oKc6vPnFRG+s6Z85NEgF7SUfk6AStTViStTOqKmF3XPvAk+zb0WNRuj5ZW7v8dHKUHBaYboAFVxGWGv5HQf/aq0i1KgXlHz6bmqw0mQe11nqr5jdEhyaRuA0Z/haCllUhN9GYcVxaPEVPtl9G63BwZrTv05rPNfsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7cnHwi7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7cnHwi7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so27577185e9.0
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 07:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464430; x=1773069230; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgPMIovbEThLlPPQFVARziyNrmjJuegOTMLHImP/d90=;
        b=i7cnHwi7df37ivJsQuJmTxKWB9Sd8TVnEkYoOy7OHhHipFz8CU+7U+FOHkmjJDJ2bm
         2igRQDYl2RjW0Nv4PqIrgquLZMUgrLuA6Lkv/iAXsf8cJJ5ViH8oL3DH71mAmYhDS0ed
         3d9g5v1cYbluYezxf9s0ZgqwzVN3RdkB4bEj7wocLvQQZM1TJGzLUsqap8ArkNcBPkaV
         lY95vQMLJk8JcpDfabH+6BaMLKB2FALH6DONJMVv6fVps+e1dWG6em5ho3wPKJZLYq8/
         e16FWHNxE1FECYrUpPAXaenr6pr3vATcjmAmzJRGNry3XMl8HkjH4NxwH5QjKHt/eVvr
         AMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464430; x=1773069230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qgPMIovbEThLlPPQFVARziyNrmjJuegOTMLHImP/d90=;
        b=b7qu1j2I9iYL4+N/54scRBdpOckVF8z9eSlHQF28Mr4SjiNRUNyBHbBgVz5w+hngjf
         meJDvYZhObbekJ4fa75QphaAeddl8XAnun962V6wu4J9dz91d2gOQudEVMi+rUF8D6bv
         7JeZQoPa2+IPaCTicM7+ZYQ22McIn7MyVG4JsbeWFNWctKlDBAubCBT5E92S/28LmKfZ
         nKnVzzRrDeSQAIto1wlBJy2kMK08YhG701PmvKkIZsks1bjjCn9Cg7O7khm+dN1tSPO9
         VohKX2XIWhqVugsR3fwKqYYbrHy0v9DPT6/0c1j7wM319wNFTkV6rAe7xjJee7BOhcuk
         omsg==
X-Forwarded-Encrypted: i=1; AJvYcCXF/cveriN9bfSiCoN/I4tgeYkF6pHKMjop656c6DQ2j0Jk2Et+ZQCtHKe49yIJYxvdaYWjGNrveA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3otpWltWNGfwbq1jpbNU0J+vmyIivc0QKY4ZQGRqvIDlk+i05
	4TpNqar+g0aNi6mo+NAEF152ONYAcYMDpvwozdgPqw8W6C7IzxS120GN
X-Gm-Gg: ATEYQzyjYzwD3B6GWNShToVikh/S6HoQB4xs49eczsLMcPRMKKhZfRrr0cLGpmm5RNg
	/19t4OGeUwSvCwvQsrGOLJlkGHUmIbHRbrrB+bt21YUPjzel5gxkXJkg+AuNZDZ1ZQVkMvb1AAf
	WQV/D+ThUvsMpKDN1jZPJD6a99Q4H4LOXTYUA+c+dgwNbHgcAMUZn2cdPuDQuVwNT7SxzgYuYp7
	BnMr1IeEbXtvil9cre1MmLdEDYUE5H7cgrd2rt/TeSVFCGcpoi6JvTiroUHIAm5QUZqwwuDViQ7
	y+8aThnMvtKt9WHW9FDIL97uUIKJbDnQhP94CPi8lwZbYIA117aCd8YBfUBFkSstN5CJo/kgmli
	RGUCBYvkfJ9enoczlgJd7Yr13q316e7pD7SVNFxBEs0oHs8tld9km9gmnG3mOG1xSZ2/UqDmNvw
	xQL43bGgfvBqeEvRffBcdqUj+Pvjm7C/vwjRaKzxPoha9BeOBBu038eVn4DfYV/+4rUA==
X-Received: by 2002:a05:600c:37c6:b0:483:96d8:9f75 with SMTP id 5b1f17b1804b1-483c9bc5b89mr218710175e9.28.1772464429956;
        Mon, 02 Mar 2026 07:13:49 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:13:49 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:22 +0100
Subject: [PATCH 01/10] dt-bindings: mmc: spacemit,sdhci: add AIB voltage
 switching registers
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-orangepi-sd-card-uhs-v1-1-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2

Add SpacemiT K1 AIB register properties for UHS voltage switching
support:

- spacemit,aib-mmc1-io-reg: AIB MMC1 IO register address for voltage
  switching
- spacemit,apbc-asfar-reg: APBC ASFAR register address for AIB access
- spacemit,apbc-assar-reg: APBC ASSAR register address for AIB access

These properties enable the driver to perform voltage switching between
3.3V and 1.8V required for UHS SD card modes.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 13d9382058fbc1c12be1024d1c550f04a825673c..4d6590aa8262009b6e5697a04b45cf3736c0fa42 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -32,6 +32,18 @@ properties:
       - const: core
       - const: io
 
+  spacemit,aib-mmc1-io-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: AIB MMC1 IO register address for voltage switching
+
+  spacemit,apbc-asfar-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: APBC ASFAR register address for AIB access
+
+  spacemit,apbc-assar-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: APBC ASSAR register address for AIB access
+
 required:
   - compatible
   - reg
@@ -50,4 +62,7 @@ examples:
       interrupt-parent = <&plic>;
       clocks = <&clk_apmu 10>, <&clk_apmu 13>;
       clock-names = "core", "io";
+      spacemit,aib-mmc1-io-reg = <0xd401e81c>;
+      spacemit,apbc-asfar-reg = <0xd4015050>;
+      spacemit,apbc-assar-reg = <0xd4015054>;
     };

-- 
2.53.0

