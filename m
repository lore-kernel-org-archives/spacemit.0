Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AB93A7855
	for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859909; cv=none; b=F9nho5kz4W7vlaTkYI4P67TorxQrcHMNc8CuaCpzMICMiahxjCO30QtuDPr44d4aJ3xGT7vcwif7P/P/n47gUM7TJSG/KsoxsPKxsv+FENNJ4sNJ84R6vb8/EnE/+/k9L62W//x2tJod53+2WiU5Yu2q+4c/LjNLCI26MJXIHDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859909; c=relaxed/simple;
	bh=ukJEaVdX4VDSTNRrPu2xDDLoME5kyYmNbMApJbbiz48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r8HJ8wwuyJh7fwMLN6cYxLNTe/0W8/D/a5eL6s8sID3XsvNyQSEnkT3AMEwrX2smW9/5tSNyFSAs+DdgU+bS8I/RHe9Ko5qvHEfIHVXwTsc9y0TEUZipKdOvQG/obRwXYHMCHB3kEjwOgxkTyGSIzL3TbVl8r3pS984QSh63Ado=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOcUQhnA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOcUQhnA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so29603305e9.0
        for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 01:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859905; x=1775464705; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bk1htAS4wrCqLvV0lbmjJX9VFRd6P5+nEK7bdtMsxTU=;
        b=AOcUQhnAN+sBG6TGi7N3ihejQUCin/HJRbUwy+TSim90UK5x3FNU6FAbf1+2zqbD0y
         psCgjUPofajK5GmivXFk9C+thH4GcGRpWG6PlTZ2k8B1OqDOslkPmKCrYFUPrp1bYfo3
         +Uhkbj3P/i9CchdO07YTP0EY3BwzwdEm4H9uxscg0XA2o5aotIFrfjiuveyHh3g7Rmtf
         7U5/8a0cdnSIUoLTcg86UX/g+Z1S9QFrXqEMfh++Ug0msVX1nZwWWhgn0nOP8oEpFDGq
         1ueSmZxTOlJTow0Y0mmsybVLbgih5NCN4j/Htu2r3olcyLXu7KNP5ECg+NutMZhJ4jrQ
         Yk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859905; x=1775464705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bk1htAS4wrCqLvV0lbmjJX9VFRd6P5+nEK7bdtMsxTU=;
        b=MQPWozHKYx9NsXn9W67fg6tcC6c3pC+gCDf3gllGt1kbYBE7riOaGmoOHzMEE4rOCo
         FMSLjmRv1Eg8ynvtQT5QRACe3glNNcd9t7tKZkRoQ9YpqP9EfajlZ3fA3Zhaca/BLphK
         xmnsjeemCw5QqzDFB6LKzSwVy8eUCFFmGqdR1uBAKGBManr4f9zVf4tixa6N/Hc/LS3R
         wujRTat0TytUYoFiB9/93/gysFlU9VGm23edMuNZf6fe/NQ/Ncxy6YKrTPyH9+n1kD9C
         fKARZZ3QdIS7EtOUJcc49g49X25YjJGkbNfUAg4S1q8RgmxOEWW3SrvwlfOHAPz7DxpZ
         KqQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5LknqFf5VI5fTt4/DTqn/uE4CFKgwz3GKKRGF93G6bjG7nGcW2z/HdUeYpBzAmm2Mo/6c/vba4g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy345ooM7KLVv9d/UJcZKZKPmcsSEnbfdMrBRoDaNKTS6hn6nF
	A3+qtYU9bS3n6UntZNZZbNIwrXa0BR2EjVvXkhUpd5xdmRHtd/B5/KoZGPPeRg==
X-Gm-Gg: ATEYQzyMviEwADqCwpV+kVQnqruXP7SYRyveiGG/yWJljSKDJgID43uac5AxQTNpPnP
	8Avq+A+Lyzk9PE48OJZwhtlAmm3KtEO58FRLvxvq5eTK9+luMSw3kih1V6cDYyQzSA3WR2zrmGn
	KsiIJEzAHaxNawBFTL4DaEwMDgVSoDi1NwQPHpkJIZ9+KL5SnANdcXIJ3RTlhwogLAatkbJRroB
	mMeKTz3Z8IqayUCp5Ebcl0pg+G6jtsEncFNmYEi5CxxiliWPZzN1zY4sk2x1SgKNSapYzJclS57
	l5jIZd19TTOdcqEsgf+lXWwONQGO+Ob4l4aXCPk5O5phOcRGfINOC2e/Qw7NYqCQAWkU8SQ51rT
	aY9Yc/z0qufcmxsHi75XpsmcZaJ/+oxzQW260FwJguoFOlcniWBIX9CKj15hfA+kboUu9ZJkd67
	tuxvvqxdjJd4AsDvreDHzwF3WDoW2YUzO4HFewjhe+yLgQLdfm4KF/JJ2N3Id7E2wV
X-Received: by 2002:a05:600c:46c5:b0:485:39d1:b4dd with SMTP id 5b1f17b1804b1-48727ef0bcemr204913105e9.10.1774859904599;
        Mon, 30 Mar 2026 01:38:24 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:24 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:02 +0200
Subject: [PATCH v5 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-orangepi-sd-card-uhs-v5-1-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2

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
 .../devicetree/bindings/mmc/spacemit,sdhci.yaml         | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 9a055d963a7f0cdba4741c1e3e7269688dcd5f45..201ab97f0e88376a4680dcca7917e8b3172bd84a 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -44,6 +44,20 @@ properties:
       - const: axi
       - const: sdh
 
+  pinctrl-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - default
+        - state_uhs
+
+  pinctrl-0:
+    description: Default pinctrl state for 3.3V operation
+
+  pinctrl-1:
+    description: Optional pinctrl state for 1.8V UHS operation
+
 required:
   - compatible
   - reg
@@ -62,4 +76,7 @@ examples:
       interrupt-parent = <&plic>;
       clocks = <&clk_apmu 10>, <&clk_apmu 13>;
       clock-names = "core", "io";
+      pinctrl-names = "default", "state_uhs";
+      pinctrl-0 = <&sdhci_default_cfg>;
+      pinctrl-1 = <&sdhci_uhs_cfg>;
     };

-- 
2.53.0

