Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7043BF680
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 08:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489671; cv=none; b=jDXEnr6KjoQPhG8Nd1yZ8ECXgDh2Lt+H5POIUMB2o1iczdaznRCDjgqq3EnVTtNAg67h97LmYHBJd7N7g9RUeBS1XfbeLJO2aC/wnRIPHMV3CRrO35JAqduS3wvEFSO38j3aHKcIEPx8uCQ+hsJ/wxUM8DUnfXPJEUK+pXJNEEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489671; c=relaxed/simple;
	bh=Zbia6kwCaTPqaM7mSuVvAG80BXlogFVq9JLCXZ979Zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dA4StB+M8gxE7NXs6dXmBxOj25vjw5DgLm6xFcW844b8DG4ee1jugVKv+zH9WSohh/PnjUMJsdC77mBkteySC0VTxYsZPQCLxOg/WhZkmzw542l5joriALAxE1g2augVS3ufRwC59xfBWmF5LldTkon7OuCuaNXly7tP9JqdOHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBsYd9O0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBsYd9O0"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so3204666f8f.0
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 01:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489669; x=1779094469; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNCRp7u8GA5aDjDB3Y0lI0oGuBZ5cilcPaEkSfJ5vdc=;
        b=ZBsYd9O0KqQaHyG7xaLsxUvDkXGeOE0zx3nc59i9Ot8FpssJF9zm1YwcKc8sSQJUYK
         hwdv0cH46z7et+WPiecev+NotKNpqT4ssij5joXCiRmXF1FoymPpANtobwWLLwkTlGkk
         xT+1s94OzGqQR/88mkGdrIvsvq1+sMsXKU2dXGcJXeSMmndTUP3Me76oTKiz+mf4AU93
         a6fNx19eCV2rKeK8DmGd8MLj1PsTyi/wgP3OsZyVQKOivk69W/a1+Fyz+cIDYNiAb6eC
         C+9xBwwUm0YVOSX8AfkFMVUjcQpzoOq0Kw5Rd6PRx0jhfryGUMIH+E5ho7aguQta8py7
         afgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489669; x=1779094469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mNCRp7u8GA5aDjDB3Y0lI0oGuBZ5cilcPaEkSfJ5vdc=;
        b=rhtKvSTFrv//SL8gi/tC+zHnIUSaqppzqvHGoUSAFYmA7Y0LPWHK6e1Ry1U6y+8/pK
         oFQ3KwO9dODoZf05BIhQSObJOQSxwy54jnlobMdgIkMy09c07VAKok+071yIL9QfAnq+
         WDyq3TTGLAeD5V2XQhZdxWguS9hj9gVXWazkq/V8RESVo/bTX6IixxzjLjMBxNRv0R7o
         sXSnClQOPqiNVDoPgZw7yOC/YGvg2j1vwWAiZkQ92JypHP88bNSmYIwO5jVF/Rt3PTpf
         zNAD0mPMis1P9czCG7d103jRgjOwFNgpaRBW6mqFGFrz9CkJ8ncDZzsDeDC4DfqKHem7
         3FKg==
X-Forwarded-Encrypted: i=1; AFNElJ/csrcd1F/hE8lUqExGc23S9Tzmu9p9yg1otd6oUVeGIm+hyTs3SwL178jqYwyK6oFlSAxw0c326A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlUBNrArc/jwrHFdsF4Jdf28a7gvs0p9eCpSKdyjPpewdhw7/6
	scP09zJQd9iXNMuiF2oDVtkjFuibT9UVFmOzgMcS4CaCA91MoMnrmSiPPNsxww==
X-Gm-Gg: Acq92OGvX+WR0hd5GTkJisNlWeiCfC59NJRfsJlNYJMdCIohEmH/uiTvpVzeWbC7gId
	IEe+P5VQo7f8Yu1uUp5jLL1gtGl1TqdIZnGdEqadBL5DC7MgYZK3jisJ5m1v9h/vKRKGA/8J9Cd
	5bUS5FudivB9GcUgoO2ZSlIo87wcE8zC/qQFdT7LaRufZqi+uBoSZAL2VDL1SssPZUppcAon74n
	nJgfTN0mTwngrIZF1jR4nZPN93LkTa1NS4D/5rNExAZbXVrsgN7TkRWqaa2qf7TeECzpVUtGULz
	7L+IWwcyxih/mL5GzdSflX2TkW24fp/YYd8SR/8Hax16jsbRW9xGl5gdxNYY4z8qTQSAnXrRa5i
	PfU3v+kP9xZ6n2PXnxbr5Hyiog0ACQ3FE1PYi+6K+JGNDnuJV9LNrxydeQpZN6vP6HMD7MAYLuh
	EFYwzqe6apE/BG2Ktv4/Yy41COUYMCV5oVDQfnPiNsxVbI1gsbS4DNZbuOzv6zsDZ2Bg==
X-Received: by 2002:a05:6000:2181:b0:44f:b82f:2d18 with SMTP id ffacd0b85a97d-452e81764a0mr19569331f8f.11.1778489668568;
        Mon, 11 May 2026 01:54:28 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:28 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:53:56 +0200
Subject: [PATCH v9 1/8] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-orangepi-sd-card-uhs-v9-1-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3

Document pinctrl properties to support voltage-dependent pin
configuration switching for UHS-I SD card modes.

Add optional pinctrl-names property with two states:
- "default": For 3.3V operation with standard drive strength
- "state_uhs": For 1.8V operation with optimized drive strength

These pinctrl states allow the SDHCI driver to coordinate voltage
switching with pin configuration changes, ensuring proper signal
integrity during UHS-I mode transitions.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
2.54.0

