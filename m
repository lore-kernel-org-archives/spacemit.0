Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327A8237707
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 07:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067031; cv=none; b=eq4828+DPaMXJjMvaEjWllRrFFst9sURWGhf218BUIKHcfflVIzsYDQb0BszTfC4smhHglfIUl2YD0DwCU3sm+DKjxb7HQk5xQ/q/U3lUDYD9dDHGPQp6z10dON4mR2MnanKO+rlrmiHec375mBry7d9s7xctivJrWAtCRklFRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067031; c=relaxed/simple;
	bh=8siO8agI3GrxN1B0BNfhRFjRtrJW4gj30PGQr6G8Bf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZHwtDM7TcRUkMNdteDWp1FsaLUE5nn0Sj4b/Q3IunSs6c6mdF2yc8mjvdFC78NcHRWWN6LMrqsVcw9SQsTtv8/i7SrO6acUaVifq5vX4rfenjhTQKS/fLZcHsGXDYhmiaIH7HU0ZkpyOSxELpku1d88uzvKoLvF+awwJ6JmNqyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Doz6apXd; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Doz6apXd"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a07fac8aa1so5558115ad.1
        for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 23:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769067021; x=1769671821; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8p3LGTyptRJ/1/i7rxaDyy2ppqLP8OP36gHwpWf/wko=;
        b=Doz6apXda3eNzXcqXn8WiV30HjPJbQ07iLECps+xtmaCUebJcALt3jP8ElP6KhFGtm
         YX6mraS51bOzD7ZlBDUCXqU9i/iByvHy70+nWzkjvU84xhUGYTSQjyTp+nWo2mp9cP/L
         59T+AuqzI2wFjMZcR5MmDHAYIODKMCb7dBoxvOTBijhIyevysheSS5aFuQ4Qea/S0ylY
         Gk3w/xYG56jihAPgf84O7rHJapRy2FNsMJmoFGtcvauKe2T/OYA+l0CGui1cLjd6jOkA
         BmEbQeMFJA9YdOhi4vEMCjf6xqqVUz6/S/YTT41lL5o1bIVEpMBVKif2P/DTCf8lEWH5
         NZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067021; x=1769671821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8p3LGTyptRJ/1/i7rxaDyy2ppqLP8OP36gHwpWf/wko=;
        b=fgmjRugX5Q2kd13bsCpn2y8HQBKMkBOjHv/gfrCyZVSjwv7LYao+oaRTtkLzFma2LG
         ssaKifbCdmv8IZqQ0e/F8Q7hCsNEPCyhwJR4hdYvKbbhOb4vzJrw67scM7pSfivTco7k
         r19gC3wzByw54arQQCFzoSgeO2DELWyaG9lBV4R8R+tDHoHnJND5IIYhepiFe9KVWVyC
         jVB+uxfrz+QekHIG7hA+owvIgBTE18auilEUV9PN4CY5HYklxbvCwKcp3TC8rbSvtB54
         n2B+vmke9FZXI4Am3nHrHvFBhJEcLBQ2k699mEsKsyuMK4nWAS6zHS8jLdi/jc+yoL3p
         OaBw==
X-Forwarded-Encrypted: i=1; AJvYcCUO7fRjYjNg+2V5eiPQbp94eLEUTSTcfPhjlUgqkBtGkTPpVYbrbbVuAg1j7l6+9Ks08oP67ahZZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVRsKAx9NOfE9x96KnRrW+zc+l/AS2FdQjXXlJYtfPXhmeMCzf
	Nnwouhr6SLQxlhHTSCGorjPRDBXc2kXMSJoNemlbRUmaBGmVj9IBfLSxU2yUlX5NUNQ=
X-Gm-Gg: AZuq6aIj/Yj4lCvEbze+CTfjOIa3CLz2cQmPKwBkj2uSs5EgOlUYAcfybfZKFqI130m
	r/+DV+JJsh0Hjk56oPBUosaB3N9+Pnv58wYWex0JpDJtROjKGB4ARrvTjWzYDZBU8CSdIqWapnl
	xZBjeMY8EUr2sNdLsza0ZM+F0jpA+hAzVBNLi8lpczoDDIuvWzcZUqN67qocNKKY+0KgVPjOD5c
	89c3YKX6Qc/gXVX0wiFH26gcHTdp9xn+qBTKQ6BtQJLwArpyUE6EtVvVNjsaQfsDzyjR9Sd2AGp
	aO8eBm2dwbIovOK+lVJIY2HbWBRIqARGPG7WhnkabflDoa6/89/hc3MsFsw3VJm+y8EdDpy4+WY
	vriCp5rlpQsWqBsetmCjSy2YeEMwdH6KryuQRyZ9uyi8HfnIe7GFqgA/Uc3mYT7llK0w7iAzu+N
	weHOYeu1z81SO7qWgVE92uDJtvUDDGtaI=
X-Received: by 2002:a17:903:22c5:b0:295:c2e7:7199 with SMTP id d9443c01a7336-2a76ad6be42mr77946605ad.29.1769067020954;
        Wed, 21 Jan 2026 23:30:20 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm171691845ad.23.2026.01.21.23.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 23:30:20 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 22 Jan 2026 17:43:42 +0800
Subject: [PATCH 1/4] regulator: spacemit-p1: Fix n_voltages for BUCK and
 LDO regulators
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-spacemit-p1-v1-1-309be27fbff9@riscstar.com>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
In-Reply-To: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
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
X-Mailer: b4 0.14.2

Higher voltage settings were unusable due to incorrect n_voltages values
causing registration failures. For example, setting aldo4 to 3.3V failed
with -EINVAL because the required selector (123) exceeded the allowed
range (n_voltages=117).

Fix by aligning n_voltages with the hardware register widths per the P1
datasheet [1]:
- BUCK: 255 (was 254), allows selectors 0-254, selector 255 is reserved
- LDO: 128 (was 117), allows selectors 0-127, selectors 0-10 are for
  suspend mode, valid operational range is 11-127

This enables the full voltage range supported by the hardware.

Fixes: 8b84d712ad84 ("regulator: spacemit: support SpacemiT P1 regulators")
Link: https://developer.spacemit.com/documentation [1]
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/regulator/spacemit-p1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
index 2bf9137e12b1d0bc7a857213d77f05387536fe17..2b585ba01a93d0ce163c33e14c8022a506bdce11 100644
--- a/drivers/regulator/spacemit-p1.c
+++ b/drivers/regulator/spacemit-p1.c
@@ -87,13 +87,13 @@ static const struct linear_range p1_ldo_ranges[] = {
 	}
 
 #define P1_BUCK_DESC(_n) \
-	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 254, p1_buck_ranges)
+	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_ranges)
 
 #define P1_ALDO_DESC(_n) \
-	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 117, p1_ldo_ranges)
+	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
 
 #define P1_DLDO_DESC(_n) \
-	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 117, p1_ldo_ranges)
+	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_ranges)
 
 static const struct regulator_desc p1_regulator_desc[] = {
 	P1_BUCK_DESC(1),

-- 
2.43.0

