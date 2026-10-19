Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B54456060F
	for <spacemit@lists.linux.dev>; Mon, 19 Oct 2026 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419479; cv=none; b=aVd1qP0Zmi+6uFoOeoE5ZYHZOOitBqCR13vnNbtSSjdjAz1huMsGV6u7T/ksjYSshNhj7J9GF8roHpzBb+/mIL4PYXPygqXcHBV/Fe1R4XSHaP5rsx83e2zfwOzNtzvCoereSdV4X9Eew/QntDCtpn8nX0+HVow0dCM7hByyivY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419479; c=relaxed/simple;
	bh=gEkTb6R44VHT7GxETUcQDEgxO+rMUGdHk6yjf37a7BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQ0E0Eg8xjuut5RbxtZN3/MkASpgLUkBBJ+Vs1+WxIDXGobbj6MVJykUAp892t78GLz+1iiAycYur3F/1s1UPTD6XfFW3wufSmDRP1kDhm8ncyqH1qxQc8iDMcvK/Jim+ZTJuIDH8cWN2biTBE9ag78+08W5LxFUSa22ui4NhDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtcbKp2z; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtcbKp2z"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8520161fdb9so1286158b3a.3
        for <spacemit@lists.linux.dev>; Mon, 19 Oct 2026 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792419478; x=1793024278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEkTb6R44VHT7GxETUcQDEgxO+rMUGdHk6yjf37a7BQ=;
        b=TtcbKp2zE4+af9M+DPkLL7D7bg6opIF2uMn4tNUZZo4HSftgaTyGl/5rUxD9cs6SdJ
         /80PMZIWN05Ji3wxUJAfhzCOsm24MagfmPAChJxM/3SnVFsD/vGPkGDDQMCnewwLbuVA
         2JESw2iJMV832UJlhjN7cr4V8kCaoH3VPEVr9eWzjE7umf3FFw0BsgNfyqEK3jUd7cZw
         uP//yNRxWehjr8mDAO5kFBQNbhmnrIvNjUP1FhpFv1phosbM/c/Wh1XvU0gO41WcFfE/
         5Xb37g9ZugLoMooRnCES6gjcCJOlHu9dJwufs7dKfnqfNPqVE1DQofRyn7Egl86lLK50
         Qzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419478; x=1793024278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gEkTb6R44VHT7GxETUcQDEgxO+rMUGdHk6yjf37a7BQ=;
        b=YAPGLCgO1iTHw6G2HkArNtFiyJwe3OIMOpk97n9m2VeqlohuAsEZmeH/RT5IhuMEfe
         79rj5lz+BISik7LPaxskMqnbdYbwFdx3dWtlaIxLywrtlsNrw0Wk1ofwxdKiouwCw5XK
         lUzzRcO19cqjD/SgwE6DSQuwaupbo29bhnegsDMj3NQXiN8VHjJcyTDTX3C6cgaj5RnB
         M5fw05z3poTa/1WTrm3vSmwM6G9ZSicu+iGEargcOJ3hvONRZA/ztzngezYH/mNCRcyS
         5hYNOHOJsgbIp/BZ+EWa6KKISgO3mQ8T0Ocm6xaPkywNi7/XjDCA5RPbLz4GGlUd+7G8
         l7Hw==
X-Forwarded-Encrypted: i=1; AKwUvByLbAzsP+k6KkMLgCQ7eungjEpc3Hrakb1cOHDVp3jJ9Q9qbyMkaOoXvhc5P3coLIy/zpX7nEHkCA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ2Z3zG/0CI014ZmluR6MoEKhRhie0v5/XlX1RD4cCTJTG41n/w
	mu2XO3LHotxTREtoYdy0iGffM+I3YwmWufosO3Fmbo0+WXZX/LFk9iMJ
X-Gm-Gg: AYBFou3e8wPqtnAqUETVSnRWqwK4x315eiNsHuaN6meqXH2jNHuPOcU7S/VDs4FQf+6
	e599oM8WccRtctyjV5CLl9StNynG6CrnIBTR7z13zW1aDDfXlTR5vGw4NYcA5vdAgRsTHTVDAmU
	pjunGtNQZE1O3t7jkTY+yr0AbyU9s5Y52G6P4yb5QTRj2vsVzhZsCizEMmBJ7vLCG0jc5dNxoEH
	y8IiZQvA/iR/xzBpNA1FivmsDSXQSTIMHlkWZDe2GxrdW50b4As3V8FaeXwFX1eBOCLRxhkrJxB
	VCLgfIIhrcDHWcQZ8wysV46xyfcEZTrgRm8LyIm21+fgxeUbfOCbXw//ZcoeAb4KE8nrWiTA7AR
	p3h7ujJ4zLQMjEquqnsVimK6sD0Eza/5630/t16OfXVGeluMPqdY6gxTske1TJu1mU4oFmnYgY/
	/a6luHuCbJTA+5OFcCqWUw4jLJUQLoktBmeJp3ZCiimqAOQ48RXv06mJ2xY3+gJ+t4t1OF5GIkX
	8k9UmUoT1u2JlULoHCYKbmS9ZD8g74Ug/hBmal6gGt0so1L4KStKQuFKn5VU0u4j6M7uSIow0Mn
	ble9bcVR8n2wlEe+2QwKuzulivxz+kuPYu/szAHVbSShFJDfnMk84g==
X-Received: by 2002:a05:6a00:a8f:b0:89d:af47:905e with SMTP id d2e1a72fcca58-8a04cb096b0mr5594670b3a.25.1792419477810;
        Mon, 19 Oct 2026 07:17:57 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f8aa31341sm3825523b3a.51.2026.10.19.07.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:17:57 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: E Shattow <e@freeshell.de>
Cc: Yixun Lan <dlan@kernel.org>,
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
Date: Mon, 19 Oct 2026 22:17:48 +0800
Message-ID: <20261019141752.2077207-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de>
References: <20261017180141.3477743-3-alan.tseng.cs@gmail.com> <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi E,

E Shattow wrote:
> Does BootROM configure the EEPROM peripheral for access? If not, I
> think the justification is weak here to include this.

As far as I know it does not. The EEPROM is only read to tell the
boards apart, so I will drop the i2c2 and EEPROM tags in v3 and keep
the PMIC, whose rails are set before DRAM can be brought up, and the
SPI NOR flash, which the BootROM can boot from.

Yixun, is there a public description of the BootROM boot flows, or of
which peripherals it sets up in each? That would give a clear basis
for which nodes to tag.

Thanks,
Hung-Chun
