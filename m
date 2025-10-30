Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD8E339701
	for <spacemit@lists.linux.dev>; Thu, 30 Oct 2025 22:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761861798; cv=none; b=DO27dDD+6Z93DySQ9s19O3CB5kXyjTlUL7TE75T8TPhvM+liKNlkD2BiUll6bXdxDp0P5+ZTqwEli+aMFjAoUoDlFsg/Rhe67UstjFCc35isjqBUwjblJnvDo90V6CjSfqcoomAwDk7We7LdddSm35WTxABV/iA/rVllVaoMoL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761861798; c=relaxed/simple;
	bh=QBekHRPzqKsUbKsby283fcZkrUPlP9R23yy3sAWgrIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S3+OvfTkwwfuDhiAUlssG6ijhGR6V9E7G1X0+Zb7VphP+Gw4wxjhXVddUfV3pujMQ6nLUcyiiXbmG25XUcYqfVSoYnWPVkeQbpl4wUGeX8p2cknQ5lequHDS4pzYWVdCXJNfHCvs/KHjhe4+ArIU3p7cW/0/39y4AzWfWqSCTmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=3H2wezqb; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3H2wezqb"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-945a5731dd3so62371339f.0
        for <spacemit@lists.linux.dev>; Thu, 30 Oct 2025 15:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761861795; x=1762466595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIkVe+mugmsixDMdOtfVXmcZx3cul0N4BhQxpoGzDAo=;
        b=3H2wezqbuVQFt0nkVI8aWLV7WuMSdFnj1JYzFjMamE7germpiQO/eIxnlbi69vaEti
         lA3SOwrh8VNZwLIyRnYxILztTROCGZQ0DcEeXAjuABbp1bR7PkrqKF1Gy9nz84s6hH3Y
         Xmp1VeOW7TQniGWmdDXO9SxY7PwIjXHM4Stj6+empoW2mEoZvyOBEY/7bFuD8y+JU+Ed
         upNbyOAMKNKm9M8RKnDSWCBYn9aCfzDxiSjLwGXXEoV1MvoFH6zJl48f0XP3bHpGWus7
         R6jT+bsIee5H1GzM72RJQIXEoo7NORc2tyZqRh1z5ZFMkLgUk0CzIEPCoDtaiTHLWYRE
         f94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861795; x=1762466595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIkVe+mugmsixDMdOtfVXmcZx3cul0N4BhQxpoGzDAo=;
        b=Xv3VUF+AezFhe+1asZZOf5n0hVrgGrMFO8VD4j9UW94dPxDmoPBczW2X1k6JLPkCB4
         xmF9+MiTWmQdcLU9zobpid/4ypeEay/NzGIs+vvofRffJIClG/AuOR6INZDP9hxxTxr2
         oDtKTIbzhjLV2ug63KdbjsCvQAoZD5EiYTcI4JP+MLIl6Xv0NT2FUSnZxq/uQQwTumyO
         nIWiMfam9EuoGa/bYhc6267QM4DByg3dPRmQ/AM5UZykVWc8cW2kSa06ES0ivoKILe7n
         WiFw9WzDOGHFSGthyPhg2Qk4AkSdXGx5vefOMDZhsqCDA3kFTArJSP5FmZkmkfqdwFMt
         RTKA==
X-Forwarded-Encrypted: i=1; AJvYcCUjyPU/JNsMLVcRL21SBkSsYgdckalpNIioFB0UIULZOfmcYqxtVQBheG4YEnfUdOB+Br5dBZk7fg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0+SHafabGgwDologlCcwXKZi6FD3kFFMTAm2iA0fhLAKG6Iu9
	5OO4nonnzNEO2QP2P5fngI90ru8UTRsECihZwMf5+MgjuQYNx61HXYZjzp5lny1ttLI=
X-Gm-Gg: ASbGnctdEs2JmKRssVGyL1iFJpMVynXvtdTG8ASECN3JwVbJ3vF5K0Y0EaM3KvZBvQg
	7wOCS4GjGKkF+Dch9fSp1XhFOaK3vM+Xr+QRpD8hhLhnLteFnrXVeoiDRnFeD64ssWsncPpLbXg
	rKjhjKiEk0tHepAr/VlXkg2vJENclMWxF8Ku3A8UX13p0QvvaVLLanBF0zfi3So3dMvmoyX0K48
	Ls11Ncc4P/5uPNAcy6DhSt7MioTuiCBe3geIQaUK1eoMr7O1uinjjlxJ0FGs3sxj+a8Za9MORQZ
	0nzC1xJVjclQ0WThQghnG87SGktWbIa4jso9xdPL9XELx0DZ0c/r2coxxxc6iHAX8HG0CKvNivy
	4kJ4pmoI1MUZkjl2ixTiMtpRxsXFExYiiDfhNWdPfMiodtNmxr8Z0Jm7t5BN5DLf11voHeVmHgW
	8HzLBh+uEOCMMRBb8Z9u3RG3esHEVUVgT10NR7KDDcqjiEKsCptNDi7w==
X-Google-Smtp-Source: AGHT+IEzkYNTEpto3uIRSZZUgywIjzKs10kSZ3Mcmn0s8szOm71bDrPz0GaeszZYMuu8RaE0By5r4Q==
X-Received: by 2002:a05:6602:2c01:b0:940:d7cb:139a with SMTP id ca18e2360f4ac-948228fff16mr274845939f.7.1761861795055;
        Thu, 30 Oct 2025 15:03:15 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359efe149sm604118039f.13.2025.10.30.15.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:03:14 -0700 (PDT)
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
Subject: [PATCH v4 6/7] riscv: dts: spacemit: add a PCIe regulator
Date: Thu, 30 Oct 2025 17:02:57 -0500
Message-ID: <20251030220259.1063792-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251030220259.1063792-1-elder@riscstar.com>
References: <20251030220259.1063792-1-elder@riscstar.com>
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
index 33ca816bfd4b3..a269c2cca3ac9 100644
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

