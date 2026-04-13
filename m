Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5323932E7
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065123; cv=none; b=aBqpFs8qZUq53lW43M9/KzYw/MCQ+/pxUIvsbHg25oy1HPSENgSGFRyXSOYWCg4YqF5acWzaVr08uW0Q36zTFK95G2lZGx8loF+7CX5cmz2hUyRAMOqgLTOW3ROSRppTlk2n8sIG+mCSkEnlXNSBTBjZMwRaODyD8AKWkKi1Cms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065123; c=relaxed/simple;
	bh=VLqXlHYEYj6QD9rr227aPs6s/WneA13bYBUQMaGOG6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JLijeuWzINDFa439pNdj5H9uriAW2Hx27Vb/ndK/D5DhtyuuTYowo9rdGdLzCjLAKXdAIGCwqKIGSrERzs1XcWW/vvyJdZ8l/ibJXTfz4ydF/9T2A7pP/chZfEAsjge/ycpn03p+ZSedWPa3vFAm9NfAGRH/MRBL/4gUnQCSXrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkq+3b21; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkq+3b21"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfbd17589so2701530f8f.0
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 00:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065120; x=1776669920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luHrHS8xuRmiKOe/fYmQbUMhMu1rL/RwOqTb1rEgANA=;
        b=hkq+3b21U2ighdPGmJqsM1YtS/1xn3MKHtp7fE3zpHXAaGt7tMHFJtsHy//Ny7AEeI
         PZ+7qPXqcNC9etMItgaVrouoS6zd72dXrbPeEGTTEo1qYgU0APWqmoYsTGcxrGNwLspK
         GaGkEmFuVl7U78rjrkwpWxosX3A3Sg5aYbuuJ7q60+zJkSYUF82J7T5NkHNIV+OvfRQS
         JhlUvvq98i1gCsVdb3mngIzo48zvP9JWHWE1z99aHoz3ZulCnFA0+rcu7puSCAu13e36
         KT1xFySlcQc+evIFoxRG1QuF2jaYdmhQNBzni6BQe1LWmMuBhXXvUXHCYYPsirYXPf8r
         peRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065120; x=1776669920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=luHrHS8xuRmiKOe/fYmQbUMhMu1rL/RwOqTb1rEgANA=;
        b=iQh7Ed+NQ3JFqt3e/a9w4jKfhlRHppUkKK3PoZgryv+VhYclMSpj6B5vByi9HtswRI
         Z8UpW+B/QEgKb1dUyvOx/I7uwoylEmYxNju4Ly6CxrNJgrb7RCuy7Wzf4JQ/qYQk/Vcj
         ApaUBnKhCQAZh8+54ot4nihzU48CcB2hk98rzbZU8DPBqNkuGtptY5KEOtoPlzWjgXyb
         JJ5c2mgwFnX/YLTz+fyhIOpZst/RZzv78ZSXJoErBfJ1B3MZvZFSMSdsqijrKSWAlWxz
         cTD/3e/AIdyEzL2qQrZ7pmGTOXpL1ZAQzJ+I9TKguWozNuMYHHVn65gt7xrUcEh5Nghg
         kG5A==
X-Forwarded-Encrypted: i=1; AFNElJ/IyBC4oYmX0LQfboB4JiZjqRS07wAk1+kNsSihbmQZ1z6u47/yyO1Wj5Wys8+CO8BTZP2tJwiG7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRVYBCq9lRusaN4TSS/+qR9OdvjbS+9veJlxRkVCvFoC27ixxN
	2DUEKrct4tv9I1pMK121fYqAhfZ9ERUNj5+kxyb698u1VhtukYcEr+Gr
X-Gm-Gg: AeBDievy3oqZuTH/Ep4kzxdgmWzmd34IaLZNuq+9iNaxBv4WlvEKgchx9TBQ6EwrMoP
	8qztv5pOH/BIm1tdCLsJ3V9OrlwJdgHQy1Zbr1VhdZdIIkO8cZ3w8p2ZXHL6TeZKDp0OrY3oEq3
	VnmBs0VcKftdakekN8BdML6aYVVEGKnywXrWe358qhalFBZ+PmJQA2m2vTvf7Hr64AzA42GOBJd
	UGIhgtPaMZ53klUZ7Zwz0wPbxXohv+NY4JG5X8hR14NARSMLeSIfb7YMQomEpC24hVC7wzshR5d
	mZ5jBVEkkNhuH7pZOnAX4zhzq7PJ5XgC4ZK95cWMC2CkKWXabi3SIoeHNsYqMfJqqowocah05wZ
	dkNNS2VS01HB2GGBsOz+A4dwNR2D27ge+j2E2WOcN1Nmfpl4O+mMCAsLvD5w0pdgcWl/rNVMU2z
	/LHvA96Evaz+UoASJLmmLHmPH3hxrI5AaH/FDOyZtSUhwpOFjayEkx3b/otzFsPsKh
X-Received: by 2002:a05:6000:24c3:b0:43d:762e:76c6 with SMTP id ffacd0b85a97d-43d762e7865mr5391556f8f.7.1776065120340;
        Mon, 13 Apr 2026 00:25:20 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7d5812dcsm330441f8f.32.2026.04.13.00.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:25:19 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl support for voltage switching
Date: Mon, 13 Apr 2026 09:24:43 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-1-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit

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

