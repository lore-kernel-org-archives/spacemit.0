Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB8E283FDD
	for <spacemit@lists.linux.dev>; Wed,  4 Feb 2026 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211403; cv=none; b=TSV8r9GmqZBUx3n9zoTDQpjnXjbcnqG6uonhMZvtoGrjrWlSUNSvVBo7EjOdxBEa8SJMfHdmfQywhC5g4t8iFElA4DenWGCALkMaiZqi5qJDajS9aHIK2NMJ1eSWGII2QGeS9IPBiTChWegSItrgFazY4NrtquiWCOHgpN5Pinc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211403; c=relaxed/simple;
	bh=bwSSjtd9Xc/oMMlb14JH7P35jXxlRP1RtYQS24w0+5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KfybDkuUivo9KT8mlkTHFMdMreN9jZb6lDsR5Rlv4h5RbjHNEndUB1BrGuSD5o0hS+4MvM/jU3xeJAH2CEziRQpNMF5F/nqX79LTTG4NAV1M4uQhkVu5tDIPtQbU867Pzm6qq8YZUPS10f/myCWNgmoYPQmikHws2gIteEVmydY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=t3GCFtyZ; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="t3GCFtyZ"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b834e17c3fso837616eec.0
        for <spacemit@lists.linux.dev>; Wed, 04 Feb 2026 05:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770211402; x=1770816202; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52QKyIhmM4dHDYapFPsbOIih+RtCQKdTf8CY2ufMs44=;
        b=t3GCFtyZpblTSFk3a6TWz0q5+YPcWi2tACAA6SS3PLIalHxcD72vrxGacCv9kdvwHD
         GOC4wMqdnXHkTJ/fEHoEGDro4Azs+QwiV05QzrOoXSAQSMT6gB99AbZe2nVDL+r+ljco
         QUWU2rxzaQnKYcUvqwjpEos2+y+tPuCliVSQMu6gLhumVFxYIc/sZeZQFg9zh62dc0wU
         ++5EIgMVbhaqG5evlv+LAxE9QeTWnSJ/lDprO8U4N2BSRrFDNwxFf2haAQzBd+q/EWnE
         7zN3MkTIv6IJMVhUwyb+KV50B0uO9qTU686Ttes4mTyfxCXq2qMCSQ3uzUToj4kOWW1k
         VNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211402; x=1770816202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=52QKyIhmM4dHDYapFPsbOIih+RtCQKdTf8CY2ufMs44=;
        b=CzzaggZSja+p3IHvb57D2DpAsXaAQaPX123phnuwyULwYAHkRwEVOiNkrA1PjZ7gAj
         vZ63Be+9dF+hBW1wpczwM/iZDR1UmYObba57TdOJXHOVVupoCWPGoBr2S8FXOll7E4UU
         Wl/QVdv4pVZq9lPyh8qmBdmx3STNe7caCaLuFSYoEd7QRHiGltJMAOt79VtISzIbNxK1
         W8/PCcc9SXnBGNQkRnbTZyRYHonk24KpzNM1fSopLpwaQzrg9anMc5uCrEJCJi2nm13m
         hKvAr/eyCRkRxW/K4HS8qV6fxjTniwbhVu83ZD6ulqmDMF0kicKpy7k4dkbcrdh7Ttej
         alEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrkXLbTBYW8hueV9Pqw5yoluOVhLZ0JKJSUnigoCpQ3Ks4OJwjS1v9xyRwNmzv+rRz9jXH44PcWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwkbPZjO+DQm/18trI9ozHWvFG0bMYLCtmh8/CJmTzaZWTLpCjK
	XJd3FKzQONShTU9ZzaSwirlMhDSndEDkGIMbZhmz72+dc7k/lbRcHJQCc2z/64s+zlU=
X-Gm-Gg: AZuq6aL+rOO7Pn4ZsbusKcPmxk7AQn2BPfQVYCzp37fAs9etBaHbsf8jUKpYTSIWVJV
	LCxVf9lxcEamvgd4TqLOJ04zU8DWw3LnIJ13wU/gnzxsMazIZpGbUx0Gfm0mNesxJFtvV+bSrSh
	DkJvklCDyKxLZnqCyhdGp0adR7O9ZX5TjfB1oahZPg7Db4d3OyWfpSnHN9DHACoJVX0BMifuwVD
	iHGvUadhle6jd82dO7OaABnITTl6zsuG8onzSfRKvxfTMZjsPjJJMCJI7fmfnLE0H2/UcWZW9xc
	v5FQ6vSCScNkfFU/1Ru8EFe94cqhl9xgzijA42OrTqZFnlEhRSPZWYUdQoM60Dgd30F78RwxfEc
	ExU4h22HqaVDJpYPCoqiAtylp/EGh0v5qRYLFtpPXMabatiDVRWVQ+WTqauqDJB1AsmwzQ5r+WJ
	0CLGHHfx6GGjlZX+abMzVIdAYM60ugOL8=
X-Received: by 2002:a05:7300:df41:b0:2b8:711:ae4f with SMTP id 5a478bee46e88-2b832876e1fmr1379549eec.9.1770211402261;
        Wed, 04 Feb 2026 05:23:22 -0800 (PST)
Received: from [127.0.1.1] ([2604:a840:3::303d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fc1d50sm1416731eec.27.2026.02.04.05.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:23:21 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 04 Feb 2026 21:23:02 +0800
Subject: [PATCH v3 2/3] regulator: spacemit-p1: Update supply names
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-spacemit-p1-v3-2-a894b3057026@riscstar.com>
References: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
In-Reply-To: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

Update supply names to match the P1 PMIC's actual hardware pinout where
each buck has an individual VIN pin (vin1-vin6) and LDO groups have
dedicated input pins (aldoin, dldoin1, dldoin2).

This is an ABI change from the original "vin" and "buck5" supplies.
The P1/PMIC regulator has no consumers in the DTS tree yet. For the two
K1 boards in-tree (BPI-F3 and Jupiter), power settings come from
boot firmware, so a probe failure has minimal impact.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No code change.
    Update the commit message to state ABI change explicitly.
v2: No change.
---
 drivers/regulator/spacemit-p1.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
index 2b585ba01a93..57e6e00a73fa 100644
--- a/drivers/regulator/spacemit-p1.c
+++ b/drivers/regulator/spacemit-p1.c
@@ -87,13 +87,16 @@ static const struct linear_range p1_ldo_ranges[] = {
 	}
 
 #define P1_BUCK_DESC(_n) \
-	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_ranges)
+	P1_REG_DESC(BUCK, buck, _n, "vin" #_n, 0x47, BUCK_MASK, 255, p1_buck_ranges)
 
 #define P1_ALDO_DESC(_n) \
-	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
+	P1_REG_DESC(ALDO, aldo, _n, "aldoin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
 
-#define P1_DLDO_DESC(_n) \
-	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_ranges)
+#define P1_DLDO1_DESC(_n) \
+	P1_REG_DESC(DLDO, dldo, _n, "dldoin1", 0x67, LDO_MASK, 128, p1_ldo_ranges)
+
+#define P1_DLDO2_DESC(_n) \
+	P1_REG_DESC(DLDO, dldo, _n, "dldoin2", 0x67, LDO_MASK, 128, p1_ldo_ranges)
 
 static const struct regulator_desc p1_regulator_desc[] = {
 	P1_BUCK_DESC(1),
@@ -108,13 +111,13 @@ static const struct regulator_desc p1_regulator_desc[] = {
 	P1_ALDO_DESC(3),
 	P1_ALDO_DESC(4),
 
-	P1_DLDO_DESC(1),
-	P1_DLDO_DESC(2),
-	P1_DLDO_DESC(3),
-	P1_DLDO_DESC(4),
-	P1_DLDO_DESC(5),
-	P1_DLDO_DESC(6),
-	P1_DLDO_DESC(7),
+	P1_DLDO1_DESC(1),
+	P1_DLDO1_DESC(2),
+	P1_DLDO1_DESC(3),
+	P1_DLDO1_DESC(4),
+	P1_DLDO2_DESC(5),
+	P1_DLDO2_DESC(6),
+	P1_DLDO2_DESC(7),
 };
 
 static int p1_regulator_probe(struct platform_device *pdev)

-- 
2.43.0

