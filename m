Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902A429117D
	for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 19:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658253; cv=none; b=laXsVCUKotN+wVY5Fot19CJdMQdAl0XHj97k4fsEpP8UxS76sY72mdpEYS1gDLH/uzWe9hPFIhPROUBQ5hzqQxlehOktw8Wi+yN/ijDW940qZSjPn7Tm/nt0FuBiPPGF4EMtzCqBX0tysPvqsNB5bpuzk1nZVs59USy2lGDSoVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658253; c=relaxed/simple;
	bh=2wkF3pIspsBICKC2HLHsuT/AUDwllqmRkvg4pojS36g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dyp9e85xTZJBOnNfpGg9cc4oEpRWUSzF1rSjyfooB0yDeM9V4jjFJA2paZIAzxUhzw3U60LT0Tppt9FVzFy9HUVXVt5UvwAIOqj1YC6SHjbiKxe5bTSB4Pw4EZyNQLvMaXeeLb/U5F7USHqMNakj9zm2i2AMCpHcoWgkzcnPjkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=JmlQSm2o; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="JmlQSm2o"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d5e2606a1bso41493795ab.0
        for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 12:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658250; x=1745263050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=JmlQSm2oN/ajou1Mzt9nSNfdgU0+prRvqa8YkL21SXsCKAxgQLkm/c9ymeQcRM/N/j
         t/gXXqY9qgWqCFjojxC3GF7JdrinCfjvUP7rWKuEu/HK3dxHF6Ooh+yYWHgTnQZ7wfoC
         hJw8AvbqDo9+eHyw7W00oA3eOHkvXlRCu8IkkLmpzGOkEOa03v1Fu3vMAwWQjRO6zdGV
         lq8cFNF6Mu1HLXQU6I2oTzxD44a33K/hTOX8N2LRkG3BTkZ4+LWsqs1VBhS3L3do+Mmm
         WMHVv2UKQ2mtjoH+QKaXlAHyQaA0ONruHxJoCtimlaFKdo5oB89VERf6vAC7XpxZC7x/
         rtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658250; x=1745263050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=XMD730lCptlUOr2vyqC7I0ls7bGMDhPPTbYoJTWQ8d9OIaTFLDKicsVVhf03lxAm9d
         bSeq5MAkP0WKUORoPoAR27GC87EZ+ysBv55/tNecXdJGgm/5+kYeq2Je2JvqDnvk5MG5
         EBFHPjUqUG85rhT8DYTtE5Pk/b3fw350EGpLJiRoNx97yojpQUrLi27T9E1M0LpOtsBm
         agKLtlyMUil6KXOMbp24L0tMp3RtckxCS7RYN6xGalf+7XYOABYyYMDMxqX6a9+ASkXk
         5wVP2DoTOiJHmnjYMwCp9kbeJp+csGaCZzr1gNQReW4Xoi7KEcLyR3cBylMHltNLRHek
         jzUA==
X-Forwarded-Encrypted: i=1; AJvYcCVP0EQH90WcSY+9oIlLdxY9ihzMwdG/a7bBloS8vTY/tTqNBVUvrCTc6XlexUQrqXs3XOREJzPrCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDpxmSImVCU5RvJRHaqi6t8lie6OWuknZoLCCy6aVrtaVvNpjj
	jx3k1KuehgejjWFhdaWDPBSGsYG9W1J4mhA+b5eLK6Lxt+uoNEUhQEYrMBLu2cU=
X-Gm-Gg: ASbGncv61t6yw0gJTqGgeBuNioZ5TWIU5T17NwjN/PXc2LZ/Fw7oLmjMdKW6I4yHD24
	tA2PZ0pTYgb7i/oQpP8CcY2cW9cipxk6Y1KjSV5XFj6VfVCEtFRdKbe9dKKfcq791KNMqpz1HSJ
	JfFWXECs8vTlx+6NqODsK0ZOlxI+PEZ8gLxQGuOFYY7zxSGOEjboflGS70WTJMkZTmBK7Xy5kv9
	101E46gw2g9T0zD4ph1BaOUe2hHkGUERHHNmCnn3y9I3hH/VoESNQoYECNV7fkph0Wb0AwCLKo2
	EY3D0ZAgXiGwPGea+BTGvN83KEot7vHO8dphpLYIpUpOQ+XNAciC7uKYjKTWa208PBsLwcjBkzL
	srrkzO83JSXomCg==
X-Google-Smtp-Source: AGHT+IEU6Rd4B2MJE8zIB8lmAeawMSoY6sk0rn3tiUuI43W7gRnclnskoSuyT6dVIrc85c9v5hVyDg==
X-Received: by 2002:a05:6e02:304a:b0:3d4:70ab:f96f with SMTP id e9e14a558f8ab-3d7ec20237fmr158153915ab.8.1744658249848;
        Mon, 14 Apr 2025 12:17:29 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:29 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Mon, 14 Apr 2025 14:17:14 -0500
Message-ID: <20250414191715.2264758-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414191715.2264758-1-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 584f0dbc60f5b..491ab891788b8 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -514,6 +526,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2

