Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5093A4521
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 08:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067357; cv=none; b=g9Z8ISikikP2CROqw7pycbyz0L6XvrrzlLLeo2bnvLtLmv08T56R3dpdZFlt/tHXdHDVJg+yK27ys3jJ2PCsaL6flKiWJcIfPVJ+rf+OZdpmFvRMyLeia2aG+/XxGo0XTZe5DDTNEm0FPKr9juOIfI1lwGRBSxRWK6DLHMbsEfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067357; c=relaxed/simple;
	bh=VLqXlHYEYj6QD9rr227aPs6s/WneA13bYBUQMaGOG6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hvPaYqCE/896fegUu0cMHpsEpMXih9SlCWLVCDxOHXQl6fYikm86P80rHU8TIQnanVKOBF+B+I8yy/6LZF9PjSej1tueEXajnGMeFp22zzNG4f4fzglTp/pp1r9gZ0M4mKR2qDOrmx41OCujHINLBUF8EXzZAezKYeD0DK2PKTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noR4rXxE; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noR4rXxE"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so3903443e87.1
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 01:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067353; x=1776672153; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luHrHS8xuRmiKOe/fYmQbUMhMu1rL/RwOqTb1rEgANA=;
        b=noR4rXxE3KdCpaY7MuGj0pEXOvYffsT/nQAEhXBDV37UF4b9fedskYA/BYaBvZvKXI
         7h4Hc0RSTNnt7iAUa6GgcqRHA/2IRkRcGIoDRXZfzSiEjqfjhfQLpOwRuFvK4riaR+pn
         IbaWuM/AFkkM02aO041Co+VMsXkhNVmcStiBMEhoxx+0R+wiCAVYxd0QonyLKg2wh9so
         4G3x+80oeXBXb9xtkxw87FW6rey5jlgI8dWGKGnLAQCPKMmn7zFEx17BGn8OnmwOZ4fN
         FaOpsRsRRfjRBeCcmIqSxHYCDb7Kcb0p0BuLrpx7xJdeCybzdb/Vfd2h7i8a3JWxfH7D
         LtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067353; x=1776672153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=luHrHS8xuRmiKOe/fYmQbUMhMu1rL/RwOqTb1rEgANA=;
        b=MduVISGD9ciOTUxFNjqSOnom5gp/nwU8V0s6hE+jRYOaeClZ028n/j5fgvLbnf03b8
         13nfY6c95q/OmCu4VsjH0JSEcxKD3obHjO+GCuh66MzvF61ty84GG3Ld/XToFQ1YKFRF
         5vtuOg+9NCBVD9Xyjshl5rDLc5V+QTXX7k9CgEdGeOeXyPgXbUpqva7jIxBbHBnnzg9R
         r89Rqu7cxe9Jk0b/6U/BcZnJsqcUhWTqFnmMzavx9cINBxbbA9R12Er7b24isYtms+Xa
         TFCcJ3FsRWSoyGio6bndy5arUBMjf73mQwpdrkF4+qGwHdIunSpRHB4EhDQm5YgpnAlX
         TZFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Hu+OS1L+7r43oUaR4eJVVROVZdpIBN/j0CRDgGO7JUqomlCBqAbxErNdAHfJJaZ0AK4iEOVXcgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfosHpXIK4DGmGdz5RPEqwMmWeq15QzE66N9P6RRb7HVxHH87E
	wNLUMs4V9njokSGmnH9rjfUf2Daie6/mNcd3MwVjASeB/YiZuo2l1BeE
X-Gm-Gg: AeBDievVIls8MssJJ8Vk8cDsbyYj7oqk3X8DNt4EnSfkkmEduR8yaVL0MDAtjE0yehC
	THlZIzSxBuZIpifnniPsliYDa4Hs6jFZ4noNi63GoLeALpYqI3SrAzU6IsAInziQ28VoSLzh4Q2
	1mKpQG+XarCaIJ1gRiHbNKk/zPTNzSAF5o/vrQMMgAarp2Hy97lhlkGkii1S8Kin1botmiX7vy7
	DG01chzDlHUSscYwDaPSPWYgBbpRYlQESYx10/8qwTqgpJhv9rqTf2e/3S3sCbqaHSB3Cod0qO9
	mMa9/YuB1clQ9UzxPyCMUz2/JzDF/6MZWDto1lP15eodMxpWmq1RHK9lTp390dVwqSfkFtD5P5E
	0L3vtF7UBrpV8vkv43p0a3GsaKz6gCVa8ix1KtJ4ZeH6cGx1/aVJRUIpoZPs9dPV2zk7LxxNuIv
	sV/mdoe1l5wYZ4nK+RXsS7ZRVOj9ZDIBm/s70FFeSI7pgiLVtpnin7zZ2Pzl8D39tl
X-Received: by 2002:a05:6512:1395:b0:5a3:7528:528c with SMTP id 2adb3069b0e04-5a3efb5620amr4070325e87.40.1776067352455;
        Mon, 13 Apr 2026 01:02:32 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:31 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:10 +0200
Subject: [PATCH v8 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-orangepi-sd-card-uhs-v8-1-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3

Document pinctrl properties to support voltage-dependent pin
configuration switching for UHS-I SD card modes.

Add optional pinctrl-names property with two states:
- "default": For 3.3V operation with standard drive strength
- "state_uhs": For 1.8V operation with optimized drive strength

These pinctrl states allow the SDHCI driver to coordinate voltage
switching with pin configuration changes, ensuring proper signal
integrity during UHS-I mode transitions.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 9a055d963a7f..34d202af909f 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -44,6 +44,18 @@ properties:
       - const: axi
       - const: sdh
 
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: uhs
+
+  pinctrl-0:
+    description: Default pinctrl state for 3.3V operation
+
+  pinctrl-1:
+    description: Optional pinctrl state for 1.8V UHS operation with "uhs" name
+
 required:
   - compatible
   - reg
@@ -62,4 +74,7 @@ examples:
       interrupt-parent = <&plic>;
       clocks = <&clk_apmu 10>, <&clk_apmu 13>;
       clock-names = "core", "io";
+      pinctrl-names = "default", "uhs";
+      pinctrl-0 = <&sdhci_default_cfg>;
+      pinctrl-1 = <&sdhci_uhs_cfg>;
     };

-- 
2.53.0

