Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78133A3E63
	for <spacemit@lists.linux.dev>; Tue,  7 Apr 2026 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550366; cv=none; b=Hvyks4cv/DEbmljIUajmzgYH90aRCPFAJORp1MGuYk6R2cEvqQa4x/FdMIo+JDUMQ9KjHgdJouOFJpvv5KbQvfPGL2y77Z1bA4FxJMX1rbAGHeQ8oOYXX9MAePOqB5vLRpuyPJeY/1X9KAYdTb/kBypI76gYCVsLluj3Rk+lVIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550366; c=relaxed/simple;
	bh=Qk/MRdECLsEU42cJzI1xmlh9FrTNHcLigqTFDzeobEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AijElexhhPPEOPgcofh1nN/HtXGd1ivavbxXcM6kMxcAXL7surI4Dqd4/nBPavd3srK1DrMzQcacyksXS/EsUMqsT6Wbx0LtIgBcOIO23IC2LhKwEUd9qrs189zDFSYttdnVzUhqhJtWB+Heje4l+uK5DgtoOYt6decNLs30bX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FG3/NWBy; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FG3/NWBy"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so3844897f8f.1
        for <spacemit@lists.linux.dev>; Tue, 07 Apr 2026 01:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550362; x=1776155162; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpUyjvSyTbzy5QP1Zl/gUHmx4JmgzxN5EinAbVZD5Nw=;
        b=FG3/NWBybzMMOEtaXHGlNx82/yIs+0Ygq0IafcVhdqhDiFlAD9fsKmiEvouqh0jcK7
         Jet5zEP1rHKxFi0iib9w59H6AHoh/BUI/ZG+QN+URy0gakLgDJfIeE3qNBCIqShX/cEk
         S/7lky2M/Y33N85xRZNY56QgVK0PwePuXRJUEsdrMrgmxBp5Rjwk5xl9iviOvpuLKatC
         aauo0u00rOHXB7QLuZefI4jT4MTxSep97jbFMxnI9BIYkpMJoHEFq2vwdDCuAl9xp+nt
         +S6Tfu78OXD9Wl3bfN6+7rEqzL39gqIDSe9RZrZ9k0+3oBR6rJJMCPQvKNSTTLKJ4+6/
         dy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550362; x=1776155162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fpUyjvSyTbzy5QP1Zl/gUHmx4JmgzxN5EinAbVZD5Nw=;
        b=pN9GhRGqwB5HbgV3baXx3MPIlCgY3wRTRdju2OobKUU3L9t7RAxrD6LjIJNl+qc7Qm
         LnU3phvqx00B30t3oWO1KKLEfjgvdXcrk30GthswuzGipXH2iKorMvvWZlCyvbVMqWWF
         jFm/2BK6YGQUBEf6n079y8inmMTQMuCSYd+yytDed8ZNNa7JBku+QFR+Ly0BVWI83kKL
         S9IhohvJsnM67+EN+dsNger2C1PK0WsI97YME8ASOyy07Oq1KY36wbrkD2Bx6pMX452t
         kzfzAN0QP1lMO1V5MoGPkWHd7sOE5cq68PMfhZU3lKo4oS7yy6Pbz3Y61F5gXIhGW3FC
         K0jg==
X-Forwarded-Encrypted: i=1; AJvYcCVNqsgZuIo4wkURCKg1Z21OZAa7ZW1Sm/Vgw3uCu6AYCw7eJ/WwkNaNeUVbB9bRUqwLQfVhtDnmpA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOtAnd1LViqxZSZjF+eBuNNRQPcQSsdAv4yZORcM87KClZfiFc
	zqM3Gd3t9pGFUMx3komgqxbYA+B03IU0SGNBfjzg72PKoFJ3+uh3KkO3GSrCrQ==
X-Gm-Gg: AeBDietNgwzR64P4cTi2DcZhoY2qRSI7tQQjIiS7nRqVuKzqDHZNyOnUgFfHqWSlW2B
	Sm+vcfPxDhusut2qbO/ydEroXoThkmw2T2qgKZccW6dpo2cVJxVqP+SmvSZ3XIqd1XpTMyafyKK
	d3lYS9GR4egbGY16JIwMKgvDxLTPN+hIEkDKkhK6t6k+ijPSQVhCpH0nipHo8ShwomZb2+WBYF3
	FBrfuVkjx+Vx9NunTZ+8zUK6n8GdjnzL5CECj7qfKkxohti22rAAoRVadzdrFvqCe0gek/yqPAD
	gTv/b8cK9JCfPSLA6TtoldbAvUtfdVK/x4j6a/pugW2kw+CveRdrEVvICcHKvOYrM1M2IQjg/or
	BDs6VRTdQdOTA3lC0m+4uJIOYwnZ8Xxyy77O9+JgkuG5Oo243lWD+rX2EKihRrwY4EgxjLkPFmx
	6LfzivbLCX+4YEtaDUUO+lX/GAQYG7kIbvFXAGJVbtoCdXopMGkaRWWS5CiDOjy1bG
X-Received: by 2002:a05:6000:61e:b0:43d:1bf6:927 with SMTP id ffacd0b85a97d-43d29295ffdmr22629143f8f.14.1775550362070;
        Tue, 07 Apr 2026 01:26:02 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:01 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:21 +0200
Subject: [PATCH v6 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-orangepi-sd-card-uhs-v6-1-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
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
 .../devicetree/bindings/mmc/spacemit,sdhci.yaml          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 9a055d963a7f0cdba4741c1e3e7269688dcd5f45..932fccc609bf8dbaf3ecfe09d9e610852ac7afa0 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: mmc-controller.yaml#
+  - $ref: sdhci-common.yaml#
 
 properties:
   compatible:
@@ -44,6 +45,18 @@ properties:
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
@@ -62,4 +75,7 @@ examples:
       interrupt-parent = <&plic>;
       clocks = <&clk_apmu 10>, <&clk_apmu 13>;
       clock-names = "core", "io";
+      pinctrl-names = "default", "uhs";
+      pinctrl-0 = <&sdhci_default_cfg>;
+      pinctrl-1 = <&sdhci_uhs_cfg>;
     };

-- 
2.53.0

