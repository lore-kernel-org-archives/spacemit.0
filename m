Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580408;
	b=Tq6v4madTPdbLfOqxaLoesT21diTnAf405x7HfT++gBiBWBXO9HD+NXXz8zrZRpNZAyz
	 kOZHiQOigN5DafvPYHuonLVHOla+O8EgN4J4JHpsghJm3ef1MDyjlDVf8sKoY/CCP8cqZ
	 XpQ1M0ewiFO3A2uBL01eyUxoEKJCxubL3jgkeyM+yhR1RHPiNepwr8O/UfSxmRTAD9xWQ
	 +mHeYNfgkDq1GU3RxXGGjVLvmvqfgHQ8+waGUdiE6lg4gazz97C5IdgylLIToHh+wYzaN
	 cTkWcyHQ05vFflteVYvEK3RW8/YiDDxbLoSBpvMvKKLX5D2YL0ZL3uNcQS/VfDvIl0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=An+ETgbADntwtFKiPu43Mts6liLduZLS5iQIAQ+a5W8=;
	b=Q2siFvzI12C/CbsJrotP22Ujeawu37uJmf/ZvV/IBhGxiuWWrkE7YZTxygCMJNQOZ2QB
	 ioYZBmOuRvAj1kElQHu2m3ZNufsImNlMe5T/IY9hL6Ta+SKbRfzhya6A0PIMnpVBoIrt7
	 C5tE4eL6zx9WRyu4tcF0h1mF2ItV8b8G/9SzEEQcfRXgc7M0DO3JkWT2EOv+vMJbInQbJ
	 RQ+Hki2ne9uciLM2J7DdaT38aiMcdzi9uYMgJ+G5L5xyTScDoiKhnCsu5HuR/JB0s7eZu
	 HkTDVDRpzp2PvW5T9rdUN2WR/RAFqKcCQdaTyitt99juTQYTQ6CMdpV9OlYyz5+MusA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=expHbg4L;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F2606A32C
	for <spacemit@lists.linux.dev>; Wed, 21 Oct 2026 11:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E4F2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=expHbg4L
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so169898a12.2
        for <spacemit@lists.linux.dev>; Wed, 21 Oct 2026 04:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792580408; x=1793185208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=An+ETgbADntwtFKiPu43Mts6liLduZLS5iQIAQ+a5W8=;
        b=expHbg4LqIDSl4BRQm7PIzY3PuoKFZNlJQ+cVjBk9acdlkNiTL/NIFHmKKm7rtaE9/
         Y1XzBtVPgScs1bC2lhegwaez3vl/mnBylhHYwArGJtz36AfGo2osR6VznpxhYMEM0IfC
         tew8FHLMhIwsdQ4poyTHujVo53GBvJtd+7ocCwDXPwi/LOY3q1UQlGfR5P/PuBW6VtRa
         PJ7Iq6vAzNpm/wuaN9Iim1pp88lnkTMrXD782ll78QovP79rGQ2sMtzsll2kSYB9f//2
         B+M1YnQcrb42IRk8uYsupTeTY1FK7rf+wCnNAHesAC0VeBMXjCgtTKqPK0Jx8xFrl/4K
         d4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580408; x=1793185208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=An+ETgbADntwtFKiPu43Mts6liLduZLS5iQIAQ+a5W8=;
        b=DusgKXzjqyJVkDVHhxWNWKeThNreE9O0TTPkShqjDFDN/yGngOTRJeXn1f2CguZCjG
         m+lSOrh5PiGV5bpT+OveyVnJYdy6utnCVG5rOWSapP6h4RgKCdYJr6QeU39kd9kZia/M
         HIEtYPlxTd7BUJHzInu4OluOpaRdcf477yCO1XeT5UbSCh8wN1MqyUz43fefP9HiSWXV
         U3n6cGAyPldzTEMpTcd9kYjhvjAyv1HFwXVEs6GmJ13IKBmT1hSElr4yS2l8C2NeXMta
         FqMQrRuSf/t4iYAKsXj93V8Eht+tGhi4W04aahtLueGgbiAywUrsixJG723QxXsbI+HZ
         d8Jw==
X-Forwarded-Encrypted: i=1; AKwUvBwnHWOusvcEBDYIbBhf4Fvi2vCauiEDU1LkFAzeQ7zrqC5mPknuZwbLgai631991Sqd7fPOvBvGOg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ+z30qx9ETIEPonJ981ycLqRSQ9aXKk0Vaccc6gmdcGI4+DE0L
	93ejXaoEtAm/Rgm8OAqVY7DqcHysIa2zJpB2zYIIi6vkXHXsXY+CtAal
X-Gm-Gg: AYBFou1cYJBKpq1iS51gNOhh0SoUOd3450PJz2IT/kjOSoS7qVHRI72zarArC04J9FZ
	0Gi1DnA8jbH2pjixfANOQUINRYnVGv1hCjqWEVNJ7YD5wc69f3NGgd7+puob2JFHX1tsLN131OL
	i46anbRpiHwRCyDqP+WK7diXVoKgciR5rdV9R+LyGL2Kl2bmN1QiDlEafgBRIftEk/5xYMMQDnK
	6nTxo/WkgJM++cHWLrgtPF0UQHcoRi4QrEtDE4cEitIVdkD60W5s+sQeIGoadeNLdnlMNywmc6R
	b8txrV0dljl+o2Pb+O9gI+INFiEDX+OdEfymYerAEF+uh7WK5mZJ48MrYEUQ/t0MFCRMsJeZU/7
	Hj2QmLQj6lraHQg3grsnRxciba3DMmpI8wlfIrEpvGZUNXZp69RHen+doL+1mfkxSwMIHUS0BEA
	fR8Pg6/FMERvubyivuGp6JF13GVDWk8HVZD6jMagtQn4alozOIfylY3msEvZ3wey194RmjxAoNk
	OBqcOMUWr8qddZXyngCrkMuVXzKuwt2nb4kQ9Gd+a2dC6g0cWSn/YSdLqgC1RZTevsC7s5hbAYO
	U6li2B/I5Kmil9cS9lkhEWrf7SLP8PT1U3Ntv6ouLSYYS21obgMMELIJBdHUh5sZAb4nYknwzYx
	JSs9noKT9fDzTWIAgdTj994YVagtLzRoXO3E=
X-Received: by 2002:a05:6300:210e:b0:3d3:ae1f:d7f8 with SMTP id adf61e73a8af0-3e287df515emr1543449637.24.1792580407543;
        Wed, 21 Oct 2026 04:00:07 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6a85c6fbesm656992a12.11.2026.10.21.04.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:00:06 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: E Shattow <e@freeshell.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Wed, 21 Oct 2026 18:59:59 +0800
Message-ID: <20261021110001.2905669-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083425-GKA125937@kernel.org>
References: <20261017180141.3477743-3-alan.tseng.cs@gmail.com> <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de> <20261019141752.2077207-1-alan.tseng.cs@gmail.com> <20261021083425-GKA125937@kernel.org>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Yixun,

Yixun Lan wrote:
> but for bootph-pre-ram, isn't it about the DT nodes which needed before DDR
> initialization in SPL stage, and should have nothing to do with BootROM?

Thanks for checking with the vendor. I agree, the schema defines it as
"the phase that sets up SDRAM".

I also need to correct what I said earlier: the EEPROM is not only
used to tell the boards apart. It also holds the board's DRAM
configuration (number of chip selects, data rate and DDR type), which
has to be read before DRAM can be trained [1].

So in v3 I'd like to keep the i2c2 and EEPROM tags, and also tag the
EEPROM on the OrangePi RV2 and R2S, which I missed in v2.

E, does that address your concern?

[1] board/spacemit/k1/spl.c in U-Boot, ddr_early_init() -> read_ddr_info()

Thanks,
Hung-Chun
