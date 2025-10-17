Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DE232E13B
	for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 19:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760728077; cv=none; b=NkpGR9US6kPxdpbpROpbjUCFY89R0ja5ls+km8Et3VQkBX2cBnM6BpWbnHVTe6sj4PzmsJnuwAM6n6/2voY/fl+Q3jTcShqMxUaqt1iSD+NV2vcZ3Ju1Hkuo84l3gwbaJZjUsGywyPOQMtDkN5W7Ti8uR1algonXPe8tOEDg+Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760728077; c=relaxed/simple;
	bh=ENUIv7Y5invqW9/JGzvHqg+snh4IuRykpfxDvM9mXnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OsYu64kUdbcVDhg/4hWUM/YagS1gnGfkqcyfuq1D8kLkcUvCzgXhKWHSMDuW4ipyQqGCHw715xK4f2w4wbet5JGDnOQDzUXzRzkyijb8ljIJcbBm9/CY7MQNyGJKkE5zChueluLga3qDkLB7LEhvfI5qMCopCm+cTDoh2F3pogw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=RydULnRN; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="RydULnRN"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-42d8b15548eso12134235ab.2
        for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 12:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760728074; x=1761332874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfI/HxKZ5aLnk6gHq9CwlPfs/i+7HssnS2IuZUrc0Ms=;
        b=RydULnRNYD5iruo0679ZX9lEsfP6QyJU6eQGhn+IH8hw9WDjBivcdE8kLb08hZmXIp
         2mKoJTbxpJA2slMFIDFJaeBlvrc4k/mTnbGnf5uFv+idO0nV6NrxzDc1LCJQOs5jwoUy
         8Fy4BFzlZ9YavA3pqLUnc8IEy7zQ58sehw13ytoDw8QS1soTwzNW+eqegPbpn/hhx7rz
         AKpUPLnVH9qpTLEKQzk2IO9cEq6Qd5016+kCm87fouWay1QN/2htIt7XXtx3pVj/vx1W
         etBki3xB2sVGg3Ro4vazqBANdIyMO13Ho+mom8WX83Fh9vY998PBmyz71qKua93XSOSN
         d92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760728074; x=1761332874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfI/HxKZ5aLnk6gHq9CwlPfs/i+7HssnS2IuZUrc0Ms=;
        b=Xc+SteDdEtwnqmoLoqQlPAXWL8PRdROK3v13xcViZYWse1CZ59i/NUsR2MIKZZmPog
         zkDxmKwrGvczNy/ySExsK7gGXxEBj99prc9rQRy934NVTSMkYjG/1aEpn6oFWGNKRXDT
         yaUIBmWrMJ7pQ2xh27CiM0zNwBylZNKMO3h8OJHnUAiO341MIbxU8yWMYluatj75yegy
         uUcLQtNBlrhLRB+a2l+n+8S7HuQP0XIC+Wyfx9i0AZkcHdSqWKQROCnnYp1T0mid56mb
         hGxmt3NfVXFiHSzRyl4aRRN+zhF246x3y3jlidOVWaY4dv+Ubsut6Iux4luxguuRw7Db
         kd7w==
X-Forwarded-Encrypted: i=1; AJvYcCWEoozqrnJg7FVKW39DFm27EiOhkshxQPD4Wb+/FYUFAnF+nkv3DE2iIGgfvlmoe+BpAQQ++Xnh0A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+7hDqaJnRjmhJM1oUoUyM/SR+dbYvXwrA2kQVMaUB+P6xBg4i
	mQpzAJJkuh87gSzj05XuA5xbyiZuI8iCiOmhVXWzE5LXV0gdhRw8WNYfaSIlTmQQqGw=
X-Gm-Gg: ASbGncu5YsY8BKr2UtEoRwcv8eLA4PE1Yh6PDzAWuhWb/FlHx+3azkmiNKAWeM8gss1
	EIxD1xSXWCehsG1QcoSIqV8jg82oHNUsFWOzPjzTk5Untd1JaDmjkpfmG8AVmqJfKaBgpsavfYP
	yqaNQAw3NZMQwPceVZ3fy49AlrZzGhh6yS3xb8OyYwmKzVpCEiZ7RQBg7F+MADcPcaaxPl5yO8y
	8nDhgnOXCjv5OwwuyE2IOtvZdvNpQVd7s2FHNGgngNIt8eg+vs2dPxqewWsIzi3JpblZNMJlMQX
	cAqQW8IFvKJ3CAtDnGKMrlXDSV9DFtO5I3jQpoqY/xX/qHwcgpFnVyUzHOPeEnenJ9hgpnCKHhU
	/vj905y8HnT3Hnsv0h6xZqUMqUWgsGtWczwj9XQlQ5ypZn3TTEbqHUm8ok+jO2EaTjWWFqkbby8
	NHStsZ5Hf9lU1E/DvLQ6LAYT0soEeOkW//7xBJPALKbrRTwN8QrU6glA==
X-Google-Smtp-Source: AGHT+IGgZuyks8/SPpqGraEYOHD64JLctbaQzahczxp3t8Isq+v66Q/LNb1tqq+q1CnCV61aP2fWQA==
X-Received: by 2002:a05:6e02:1a42:b0:430:b338:e55 with SMTP id e9e14a558f8ab-430c53068c3mr81229225ab.29.1760728072707;
        Fri, 17 Oct 2025 12:07:52 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9768b98sm153462173.46.2025.10.17.12.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 12:07:52 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] riscv: dts: spacemit: add a PCIe regulator
Date: Fri, 17 Oct 2025 14:07:38 -0500
Message-ID: <20251017190740.306780-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251017190740.306780-1-elder@riscstar.com>
References: <20251017190740.306780-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a 3.3v fixed voltage regulator to be used by PCIe on the
Banana Pi BPI-F3.  On this platform, this regulator is always on.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 2aaaff77831e1..046ad441b7b4e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -30,6 +30,14 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	pcie_vcc_3v3: pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &emmc {
-- 
2.48.1

