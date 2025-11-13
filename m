Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40CE325727
	for <spacemit@lists.linux.dev>; Thu, 13 Nov 2025 21:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763070358; cv=none; b=AnYhXDKb13c8Zf57j6L1TNfs25MGwkH8C1HN+9ORv8+bVQj4FT1C1bKP3Zdz+jea1bPEqSKMFVy3R4xdKEXACihOviNZD+GYw9X7XHT8PWO2q5w97gtnc7rAUJGXnlVUsvN0zuZMNM1hOgkcDef21y7GOTxltl7OzVqQsDdBl5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763070358; c=relaxed/simple;
	bh=rpoPtr0vcuPSzME+OCHzsK/d0X2Myz27uF4+n3Cpbv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YmdN3iAtpumPuaQhHLeGSeqzNsHdhfaD0uG51CgEtzogjWOuTnfzPFr1xfQIav6YStEC68WIyGX1SrPvaAc2ND9Popsd6LOGHmtPTiHbM0rLGLHf+tz/cu3sO2UVW9ZHBfJtHVEm8rok4rDEjsEIVp0sppCQCIMXx9im1qxB3kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=2RrMgL6f; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="2RrMgL6f"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-4330dfb6ea3so5535565ab.0
        for <spacemit@lists.linux.dev>; Thu, 13 Nov 2025 13:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763070356; x=1763675156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrbGzwoMT9Ducrx+C40YCeeXZtuMUvm1QSQu39eFix8=;
        b=2RrMgL6fxCIAHl2dGPuEpVu8550ALGG8/aMN/itWjdMk4yjsQAnDJu8VwRj+vcHqv7
         mxn3E0VOCMNauFAptFtInUDMhOOADoZG25HcKplavLhuid9aCcHMU9zUND1/IyTrUCbL
         VU+tsAx7nqlbF64fGklFz1JMSN8qX7C/AmenyiVnzisA19vkThj3/BngyWiAsVF3wdWe
         nbH4wuoKGypl/JW+Wk8Ncgn/U52SETOd4uJcGeBzwaUsRXVTDvZhmGdBCEZF6yHQGXA6
         U/VOwoclDi/hAzGbZ8kRxQ1XNX9GIrtcJAFpegoJDWQPxuy6xSntIvrYQcPtBp32Es61
         nnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070356; x=1763675156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UrbGzwoMT9Ducrx+C40YCeeXZtuMUvm1QSQu39eFix8=;
        b=bPX3mHMlNsWjrPg9RXGMjlUlUwr7MpJjyaQXKzfTCFtHCHRlQK9cyLv1/69d4UHb4l
         QpBqYUlXBW4iNVZDB62W/ARPnAMYs6dOiMYSy/1vdgzwsmt+hQZykn7tlpixwto4EU9R
         nnuETMke0qAVhhF2nIcYwIMpwR4louwDGHwesIGcsvktuff8YsL9UKlcM7s/ZzppTsWG
         vStLCCeavphpvRWCjKzdAB6VKmUoHynEiaBGdASmA0wVfl1uCHyspZSmpCgTI8YtMCSS
         EaGhTp4CWLGLScr3ZYxIOFeqfG7VGrrQY6O+Xt4iXoCgvDlkeFTtsprWUMY3sZfpHoaI
         z3ag==
X-Forwarded-Encrypted: i=1; AJvYcCXmgLNLuFyZt4AuIu7LdjExPFeFLFgEy/A6MiPuy/6CFDa82z4AtvGacHHjRzcvEMLaUFoBy4yfAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4wuriiB+Ec1+N/Z3se4hpcMsooVyDNlxIH3u4qhFEQtiKEscO
	UcI/YCd9Z9yYDYGfsctYjc4PjnPZBoTr7rv0Nc0prvBozOuxO44Z6a1P9gwrk8fMwQc=
X-Gm-Gg: ASbGncv9Awtcf6UBcvxTdxFlHWiCOIZ0o0AW2q38b6z54hcLlNdN76DRUdui3sKnAnZ
	cHygvDK96hyl5/yeOliZ3GIFowceiTzcVp346xTNm5YZd/OYZzK+NrZHyCM9KiV1dyJOcuDRN1Q
	46cdnX8CchkmV3IptAP0JKJsIQKVonzcZATKCrDQlgmyYK98H/hEOPF/DAeQRH7rrHPK1n5Vfmp
	rlk9QagIeU8vcC6Wt1Ty51BzXG+UpqIsNoxCGsqK3V4t7RaucRVkTPMMQ43jipwG8exEtYzNbRg
	zH9g/RwD1lEpLL96sLpFIMJ+J+Kf6UsEwqVLv/PtKZiVwrBZpJawvMmNsvZXGtDgmjFPbg4jGQQ
	fK7ihGfr0ePDTrcTg3g96DwR7fIqB6/JDCegUtHjHkNhHPkkxfjiAdRBDQDxSMuyd77xo0yJbxH
	zq82tl6QCFxpMtjLrm6FHayBBEwUNVbpSWK198X5wcEoyWf5nhsBwqew==
X-Google-Smtp-Source: AGHT+IFomP3OhkAPUlXBqH3nkrCRAP2vPJKy7pF18zv2dwYytVZuZbONaXMoLuyWSdunyx1jnM/2/w==
X-Received: by 2002:a05:6e02:1d99:b0:433:7e25:b93d with SMTP id e9e14a558f8ab-4348c949c9amr17614215ab.28.1763070355985;
        Thu, 13 Nov 2025 13:45:55 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839a4ac7sm10877115ab.25.2025.11.13.13.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:45:55 -0800 (PST)
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
Subject: [PATCH v6 6/7] riscv: dts: spacemit: Add a PCIe regulator
Date: Thu, 13 Nov 2025 15:45:38 -0600
Message-ID: <20251113214540.2623070-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251113214540.2623070-1-elder@riscstar.com>
References: <20251113214540.2623070-1-elder@riscstar.com>
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
index 02f218a16318e..71f48454ba47c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -33,6 +33,14 @@ led1 {
 		};
 	};
 
+	pcie_vcc_3v3: pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_dc_in: dc-in-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "dc_in_12v";
-- 
2.48.1

