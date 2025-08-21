Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472501DDC08
	for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755765159; cv=none; b=LUXTDM1lKqOAtaHKg3cUaI+2rdVnUOklCmOx0wRCG1IlyElPGHxPvS9ATDOdpOVt1SWzeOBw7kBuDhWd/za8oTodXNeidympiE+2PuzDwdHhlxdG/JUdmR9TR46gYAGvxCFuzAEJJiUSQza1sQzBng/AgGQDhW4szn2r/wzRe+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755765159; c=relaxed/simple;
	bh=aiOPgCva8kudkEPl+V/XfNEIoC3r9JUXD0el5mRjFUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qPVWxbmX88OUNqKnmfaVFtW2sl8mIdBEr8shZ+XkjYBlaKR/b3MxxKy4p5ssCBxDs/jAdRtJkcmqL5eBaG/+SKmO6H6AazT4oYgZT4jQo7iX32O2pfjfWT+70CjyC50bLHHYZ0ILW9snbYfecxR46yygdik0agswzhtePpH2Vr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mtHGIwQq; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mtHGIwQq"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb731ca55so8526566b.0
        for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 01:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755765153; x=1756369953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tpMok2B6oSFp46bPm9JfIyRCEx8l+K6LCpsnmOC61A=;
        b=mtHGIwQqTeQdl5aac9cDfSGsT3awD0LciLcmNXzpsrIKNpF3ht8ySiEK+5XpjIWoZ5
         c0SBJpftvtsEup8DWQYk+uAiStyTIJyd7zBXnylAe5NeIwGb5o8jlpT3IXGQZJCiKyen
         d8pmIW2aqcOIo06sa0U/YI9kWXki1ueIGo3es5dvxnYlKjt+jaeFkhkIrDM1zeDtsVg8
         KU5KHYwjKA4fH9YhZCMTtBZR5m7GIdqxyN0tIIA8B0hFpX8BbLXnydHR/IGejdPo68WB
         G+x9Du7mIsV6NwEuXTlGz8+YnFT/wFDJPI/6k5vZjxwleoM0g+56r+l4LW0m+KSHj7Sz
         N9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765154; x=1756369954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tpMok2B6oSFp46bPm9JfIyRCEx8l+K6LCpsnmOC61A=;
        b=EsBCAOBTwKPjyCFQdbNLWIkmQfYmo/KG7NujYUJ5h140wcJTP8BKYLsg5XHbb9gtvD
         djwyLtPB8f18eQLJ1rfTIyQWI8RH+RitjFu10FftPsTtQArbtfS9lYQHTGWqpieZR86Z
         2QajagKL/grdp1GPTTPWZ6/GFATA2qKjhS/f1anwTELNCCCYSWcgEnVdXHZEX57LyH8o
         v6GrC9ByPZM4FF4DyzAI+pDOhRqNo3jNPh4w2VZS8apHLnTlO/CwZ++ybQZf3PHA3yjL
         DcOdMZhRd5owPZV72OfeUXJrsrWVv2t4Wqrk0mwAQwd2hodm+OhCZ5ysv/kn8xorGj+a
         6V5A==
X-Forwarded-Encrypted: i=1; AJvYcCUJVV0gvGt+UeVZHJ8QH/1GBZZDtJ8qgJz74WPr4pOq8UMfyO+mjBAMbCT0tQtfoqP2+OwdAOcvvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqcyUm10s1zOOwQ6dAaZxgXvfCzGH0jWUAsXrzyUG6kWo4oFDV
	pxxoFCDOOHHK9A0JSuhopi+eeOUIAQxNeoUQgQpQN0Rou34eh4S0BgUBiazV+JIh5fo=
X-Gm-Gg: ASbGnctjuKz2R7cnmVXlWYp3Bhqderie/D0wgtqAf8ZclolCETz+Cl9vN5qnDlfNWJ4
	q+NjTb1fZRl5tIGfqleMnOOCua4eC1R/u6xXu6ECw6V66MIn/FLLcBn9u5Jf+KBKViFB4m1yBAC
	EU6LBcP2+PKajAmnqY3XyeaVne+A35p0RmmaxP25kFY3SSh8Q5CifRusLs0HogO6rJDH3qWlvpk
	Sy/9eoxOT9Aa/cMBjWB0HiTx5qguVB6jHXcA2HJ5K56DMVUC6SXkG6UhmzLe5dvbIawgYmVZaOv
	0iGdvIphCvbk1v3z/lSpIte7Kz0NCuLIVv3vw8YVnfzKz1PTAuIQbi/K1hqgBr7aVQb6owH+NDA
	fEuyYzt5Madqw3vBBfyuGj80xhurRHFSJCw==
X-Google-Smtp-Source: AGHT+IGrKLDvcNhMPRRUz5yZ/0B+UqV3cuCDD78GAK5IX9VMQFlpjMOiQBg7/gspXEwR8WFrVNM3Ow==
X-Received: by 2002:a17:907:94ce:b0:ae4:1093:d41d with SMTP id a640c23a62f3a-afe07618e48mr78991366b.0.1755765153518;
        Thu, 21 Aug 2025 01:32:33 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded478bfesm341676166b.60.2025.08.21.01.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:32:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Lukas Wunner <lukas@wunner.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: gpio: Minor whitespace cleanup in example
Date: Thu, 21 Aug 2025 10:32:14 +0200
Message-ID: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=aiOPgCva8kudkEPl+V/XfNEIoC3r9JUXD0el5mRjFUo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoptmNfZQGc9s1xwN7F1mVlmTvdanxSxY0HauHI
 HP4rAniXDCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKbZjQAKCRDBN2bmhouD
 13frD/9kUAvsG4k8pJHW7pM/M1lFmN1E9aryLzVWQdCoRNM+oMCJXweuixV9wDUQtiguoG73Da0
 HrY+SLZZ35XqDk/J10NgDL8vSKBSl/QH6wD4qhZpDxcRB+gNfBk+XtwDnwULbdNhsxf6Jo4PXrx
 HJribt3Qh+TFuMQJP85Q8wEVZNRdE1iki2kV6LWQVLDW5Y7akzcYz4gdMKjYfWNdQxlrimLk9Ob
 VFKndIUkSaEHo1izt8KnxGxdoCKhxRMDtSEi2BJ7ixlugZ2z29M3ykbYCCsidPnEs9hJt+J3+QM
 i+V5+WO4l5x2LEpUZ1+Qyq7+XUq7JkBBCTFq04DZ9l/S1QMLyBRo4XXShVB7MmvVrumAhy74KSo
 PB6aI4D7fk+4WexLlIOwKHk0GXVDiXSnmSqBfKX6RQqv9V1TG+FliEIex4cmGMilpT5oBPURibT
 19arh2P8kq4samhnaK6kFAHQ+iVo/MuT8UiFAjtWw97nSfRkrWVeEwl04yGd8YMludhYjju1V3R
 uamX9C1mdkuzSJFM0C4YBAV3a7irZZMDfED+dejWUfzPZQPvzJfLz/ZWaIhC1Z9OWIVrhv1xLL4
 NTO8viJCzgJ7dFii5xPMpRjF4ecUEoz8FVpiDWuebjdIRRf3rHRlE+KiFc9nl7cTXLERfDHgNcg ZfzyrRVol9a3U9g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/gpio/maxim,max31910.yaml  | 6 +++---
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/maxim,max31910.yaml b/Documentation/devicetree/bindings/gpio/maxim,max31910.yaml
index 82a190a715f9..4d200f9dffd5 100644
--- a/Documentation/devicetree/bindings/gpio/maxim,max31910.yaml
+++ b/Documentation/devicetree/bindings/gpio/maxim,max31910.yaml
@@ -95,9 +95,9 @@ examples:
             #gpio-cells = <2>;
 
             maxim,modesel-gpios = <&gpio2 23>;
-            maxim,fault-gpios   = <&gpio2 24 GPIO_ACTIVE_LOW>;
-            maxim,db0-gpios     = <&gpio2 25>;
-            maxim,db1-gpios     = <&gpio2 26>;
+            maxim,fault-gpios = <&gpio2 24 GPIO_ACTIVE_LOW>;
+            maxim,db0-gpios = <&gpio2 25>;
+            maxim,db1-gpios = <&gpio2 26>;
 
             spi-max-frequency = <25000000>;
         };
diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
index ec0232e72c71..83e0b2d14c9f 100644
--- a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -80,7 +80,7 @@ examples:
     gpio@d4019000 {
       compatible = "spacemit,k1-gpio";
       reg = <0xd4019000 0x800>;
-      clocks =<&ccu 9>, <&ccu 61>;
+      clocks = <&ccu 9>, <&ccu 61>;
       clock-names = "core", "bus";
       gpio-controller;
       #gpio-cells = <3>;
-- 
2.48.1

