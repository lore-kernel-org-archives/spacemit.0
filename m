Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C500A3148A0
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 03:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768878222; cv=none; b=JtjNwnJLmGCYrxg+yR6IgbvdtFrvpjT+aB99Ok3mjdB2aL29rb+RLC8XV2iKQQb1lWaVDHDEZRSXxzZAux1ywizhGQURPdUqdTMf+jbCN4HW9MmLt564POIdDnDrWCaCoZjDK03bDXYGl8OWHz0b5Kf5vqcYIJL4Tl+LMsDHWe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768878222; c=relaxed/simple;
	bh=n5A0OXSyk7lo7f3jHURyz0bX/5X3lYhpTO7Z9MO/Uec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GaWnqttZnxSEbP6LP+ijTZ6zm8GZ+9SxOElYELktU+w6/+RTpLjkqjLoidNmMMNQbaKb0+/zOV1/puDezX05tZfGRPC8xDnu32nNM2YCTFjKsPdE7s4B3qLjXW4j3v6/YMBguaB8CBj3pi8FcNih+tjv6J38Bf7Ncj1u+9H6+24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGGBm8N8; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGGBm8N8"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50145d27b4cso52002351cf.2
        for <spacemit@lists.linux.dev>; Mon, 19 Jan 2026 19:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768878220; x=1769483020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=BGGBm8N8BfhNi30GLW+2ChtI1bHF/QID/0ZUqxg/pCTWcT1dGJB6PgP/Vkv1HUkM3F
         pB1nUuicwpbPhFBR5aGE/6UvWi9pB6MJDFtBr2ldjHEfGpbsuu6IPBAMSe0moEA/cFsm
         qMsgwtt6iaV77YHk9bA2/q73nD2kKfPtrWOipPGja23CU1EDNAkNAObknnIYorqhUszq
         7xd3rnumtw8mlQpo+Ci7qATaBM7i8qqcu0amUrsg8RZMYE4y9yD6S6O3tXc6FkkkEh20
         bPK04x7qeJIh+j2LmeExkP5VjQ3OwOWKh/o7wcnjrHRH/Nf+zm2jhOAwmeRl2j6nFWM8
         UNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768878220; x=1769483020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=nqO1SZc7v2ZZ9O9GbyC5elQQ6FU3raNOQHXbAc8E5eT1IOEvD1hEu3YGhIHsLItKRs
         Rnn7+nt3PZYPU8zJH2sGi5z1uYjIONQ+nVFYyR3ICNxW8ddN2jltna+YVF4xMoPwnqgL
         /rNeZDTB/+IJRg7pXVe1DcpT3IyTW72jpnwz/gjNKMUSNXHU5AzbEOxdx4NleAdPiGCm
         xeo18XqP9kg7JTWBk7a+Z4LgxQtAM6jQCBykneyLZJhAzcGgYchz+tYWK4a2cN8Bz7VO
         OMpDxnYd5OLa+ts5lcKjeq9LzNc6iMyGt0bGIXaqWTZtN2x4PP2NeIm8RDPAxGLhCABn
         yw6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXI6Zruj6JQf4rd7MfaDcYZhuZbZNDiFq4S70IgzDNW6DmUYAAMBF04tS6BXnSJvesBIUOESIV/0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJbgn1q95L3tZyS2IKbzAkcnR2QOTk6vyUd909LLK5KyOEPATO
	xrUkZC3xi/nsf2D88Tb+oXKn47ii0r6WazGwGeWtUB5ZC9Scw/Sb3p6zwUmPl/t1
X-Gm-Gg: AY/fxX4tT/6917yyiG8eKIgdRu9RKebVI0hyqygPrNnrVfwbD42yOGZfR8yLTWShoeT
	ljZm/lshVkzT6All0DNMz0Z5PAeUAXRN0ZE7UI6tgwnNC4XiRR2QSF4HKmRRHAK/nZ4PVwAxymJ
	N7lJG3eRXMaVyIpZfc9ydp7nFwSejShrcGYub2TKIkguvBdN+BM/wJbEhTAF6S40SEILZy1wMgX
	9wDPGNPcs6QEapQ6w+bbGf0SIpPIwRfP7/NW+i5BdRLrKI1iY2mm0r1ZaNLv4+7UlVRjPryet61
	OBuhHvgFgkGL05SyuMtSurRB98oyX8sJoKQt3UnhzL+Oai6EBQAH+m1KrosaCesi+LYU4TI8uF6
	qqdX1rmAeIJ8iAzyJ0yBhH8dD8OIssz8BCtN7fxmPkFPp7StmsM698OimvEinu28AgXDAVl80if
	Fdy+jw7JHjyShyuBOS2e7J
X-Received: by 2002:a05:7022:6288:b0:11b:7824:5c97 with SMTP id a92af1059eb24-1244a769feemr12788374c88.40.1768871785704;
        Mon, 19 Jan 2026 17:16:25 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6fba43c3dsm747540eec.0.2026.01.19.17.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:16:25 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guodong Xu <guodong@riscstar.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing devicetrees
Date: Tue, 20 Jan 2026 09:16:14 +0800
Message-ID: <176887176536.427065.4468747981087466363.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 15 Jan 2026 07:18:56 +0800, Guodong Xu wrote:
> The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
> much later than its component extensions zba/zbb/zbs (June 2021). Recent
> updates to the device tree bindings [2] enforce that when all three
> component extensions are present, "b" must also be specified. Related
> discussion can also be found in [1].
> 
> Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
> It is a trivial update, but can help readers reference the correct
> document version. Acked-by Paul Walmsley in v1.
> 
> [...]

Applied to dt/riscv, thanks!

[3/4] riscv: dts: sophgo: sg2044: Add "b" ISA extension
      https://github.com/sophgo/linux/commit/f16ae81b80ca4e721f4c4ed1f28390115f7721eb

Thanks,
Inochi

