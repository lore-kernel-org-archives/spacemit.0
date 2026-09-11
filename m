Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C6F46C851
	for <spacemit@lists.linux.dev>; Fri, 11 Sep 2026 08:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116213; cv=none; b=hudFP5Aw1zGXfOiuc8pxgoFKptLq1rDpWbB7D4w03TGzdJUYCgH1RdTPhyajJ2YDxKpC3wa0YqPTk0hw8hTCCSoKheBcmtxu+df5Xlq5vlo/OSmK2x85oOopbJ2tBl0Vvo4ZSS301lxPSzhy9iQFCbhchbpBKuLRDrtmqyVwxDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116213; c=relaxed/simple;
	bh=tWrLmSoHdiPwcU8P5dhf3tp+NQtQslZc1xK9gAQ75H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HyWLdGxhbARFJEsEk7nqtklyUd2jCngPo9+w9+Lt4ZlOMJzqCs6rweZ/8l346LbxUJXV9zHQFQdyKCf/ZcNlGw4ZBfR0dnB4r0/ArPAbx3a6wicuyoNddm8Kf7/YH0r7NsqzYSL5MXLy8xdluxpltS0wxV6fqQqoTMknkzM4TUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAKjB26D; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAKjB26D"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4902427c1so583153a12.1
        for <spacemit@lists.linux.dev>; Fri, 11 Sep 2026 01:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789116211; x=1789721011; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7nbu7B+bglE3m9s/GZRfFOgm8cRTpe/a1+eyVcACJU=;
        b=rAKjB26DW3rF0OVBEkd8WNbIwzfh+d/ToEvtWWBgZlFs5GoJcFxxvzfWRy1S6wLpwk
         UIgNdEfv7YoS75BY8i/gfIG57V/fdBpcarogHc97hje7Gx7FQmmCcNeDilI9X0aA7fB1
         y9Z4A6Nmtrv+4NWMeFqBqUxxjUtm7J098Sqs7t/0S5Ocw9AFu618i+eyK9jPE+ow82V0
         FEx/amqRSYutnfr5l0+5KFn6a6ARGhTAe7iVf/renup9cI+fg6EDr5E+I2RaYHvwDo4d
         Y2TJyuJxSmWqWp1S/8EIccH20EC01zkS+dNWDFzCsgsnWisdFOojpyvooaIu1ZBFB+Oy
         AYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116211; x=1789721011;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7nbu7B+bglE3m9s/GZRfFOgm8cRTpe/a1+eyVcACJU=;
        b=K+5y763kfsSUgWKHc/yalPLjF/eRoxBnJhQFBjTPZGUrRpaJMleGgInoKK9qRq6QfW
         lvohqU9PUl5RUegLkCpKX+sG+kwhwSC1y/+bVW+UFqimT/bpQZXkA7mFoEVfGKYi5bjR
         9TXRw4qB13AKAXly0GtBoDZ6rGYQyiLxsA/9YKmCmDKQxLsHvwXcKP2jwUDpbzJpNHKG
         81xAuLpmoKG1zVp/Gajv+XxS7j3stittSoclxrgx5+w2ocFVMTZ49ta6yCH9+dSrEg98
         KWKudQFSPn60NfZ707uSPpDZS0Cv954EVXNx8I1jSlEQn9ITw7DitL3ORg58IMDvBJtO
         SwtA==
X-Forwarded-Encrypted: i=1; AKwUvBwdXb7IMUlvgNp+U2/EIrEkoEsqJ2VZwn3cBeBuLMn69CTofBbQfuEIETOhNJrB7JTJLbtLaB0pwA==@lists.linux.dev
X-Gm-Message-State: AFuF++kpUurDdEWyOkNh3M3uz4JhWOvt6hhHcMNA9zlDeTulUj39OtAS
	R1djec/wt/AuCMQz+FaADAxPIteahYX173x5t0qnc57Caer2VPB0av4b
X-Gm-Gg: AYBFou37sDw1WtUOCr1jli1uh0VnIzDTDSYZTe87JtiHP3K5Oud8goTzAuEbUp/i9GJ
	M9Q/IJYnYgQc8j7boFEYlo5rLskjTUPOIngIJnsDXqeHWqOOTIHUjDm/E36Ey1iNEahgFtY+SIA
	Qw63lG3wmzeB8o51hAhy7Nkgpr8JCSsFkEvp45EcLzbLH07qXhfLzhfyFabKqUFAMm2sclvKYso
	lZRilY3zbMXUIebSyjSgBLSvEIA+/bfG0FeaesJyW717fHKt9HcU6wf4hu05sJHATbppQIfcHHe
	+GZXM/K/rQTzSkW+CziXWBoJTgQ5xL+95L9uEoojxAAeZBDyHrCBrfhS6ktzj9vBYkLzkJAlJVL
	Ek4AKTx70kHbGMuejz8lBRbPMTk4XMDigdCjmyztAFFmjTGAy0JyyKnK2Cl4m8FHSbktiZ3cjBq
	oOXBN5dWikMfP6rzk5Ah93Uzk4WZoueG2fpHKFbmbbUPjGYBDj8IGZnBnpkhLi+dKk0RXc/LMeV
	g==
X-Received: by 2002:a05:6300:6cd2:10b0:3da:e57d:4a79 with SMTP id adf61e73a8af0-3dae57d4be8mr3715040637.13.1789116211210;
        Fri, 11 Sep 2026 01:43:31 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c657156bsm813945a12.21.2026.09.11.01.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 01:43:30 -0700 (PDT)
Message-ID: <0f82c603-0ddd-4d01-bf48-56d0ffcd29b0@gmail.com>
Date: Fri, 11 Sep 2026 01:43:15 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] spacemit: k3: Replace bad CLINT node with ACLINT
 nodes
To: Junhui Liu <junhui.liu@pigmoral.tech>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>,
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Junhui,

Thanks for your patch. This would give me more clarity while reviewing
the OpenSBI patchset from Troy, and I was wondering why Troy sent this
https://lore.kernel.org/opensbi/20260908-ipi-clear-all-v1-1-b1bd5d016eb6@linux.dev/T/#u

Now it's much clearer -- K3 has two ways to do IPI, ACLINT and IMSIC.

One thing that may help us further: Can you clarify on the exact meaning
of "M-mode only"? OpenSBI would use PMP to protect those MSWI/MTIMER
regions, so I wonder if you meant that it's enforced by the PMP settings,
or it's *actually* enforced by the device itself (or fabric)? AFAIK, to
achieve this, the device must have a way to distinguish the privilege-
level of the CPU at the time it initiated the MMIO request. Hence, the
core must be putting the privilege level as some kind of attribute in the
MMIO request. Is that the case in k3? Can you confirm with SpacemiT?

On 9/8/26 09:28, Junhui Liu wrote:
> When testing OpenSBI with the upstream Device Tree, the CLINT controller
> failed to function properly with the irqchip.riscv_imsic_noipi boot
> parameter:
> 
>    Platform IPI Device         : aclint-mswi
>    Platform Timer Device       : aclint-mtimer @ 24000000Hz
>    
>    Domain0 Region03            : 0x00000000e081c000-0x00000000e081ffff M: (I,R,W) S/U: ()
>    
>    [    0.091014] smp: Bringing up secondary CPUs ...
>    [   10.104917] CPU1 failed to report alive state
>    [   20.118689] CPU2 failed to report alive state
>    [   30.132288] CPU3 failed to report alive state
>    [   40.145953] CPU4 failed to report alive state
>    [   50.159604] CPU5 failed to report alive state
>    [   60.173212] CPU6 failed to report alive state
>    [   70.186981] CPU7 failed to report alive state
>    [   70.191411] smp: Brought up 1 node, 1 CPU
> 
> Through exploring and testing, I discovered that the K3 actually
> provides all three complete ACLINT components, and subsequent
> confirmation with the vendor yielded the following information:
> 
> The ACLINT controllers are mapped to two physical memory regions:
> secure (0xf1810000-0xf1820000) and non-secure (0xe0810000-0xe0820000),
> with varying accessibility per controller and execution mode:
> 
> +---------+--------+------------------------+-----------------------+
> | Offset  | Module | Secure Region          | Non-Secure Region     |
> +---------+--------+------------------------+-----------------------+
> | +0x0000 | MSWI   | 0xf1810000-0xf1813fff  | 0xe0810000-0xe0813fff |
> |         |        | (M-mode only)          | (Inaccessible)        |
> +---------+--------+------------------------+-----------------------+
> | +0x4000 | MTIMER | 0xf1814000-0xf181bfff  | 0xe0814000-0xe081bfff |
> |         |        | (M-mode only)          | (Inaccessible)        |
> +---------+--------+------------------------+-----------------------+
> | +0xc000 | SSWI   | 0xf181c000-0xf181ffff  | 0xe081c000-0xe081ffff |
> |         |        | (M-mode only if efused)| (M/S-mode Accessible) |
> +---------+--------+------------------------+-----------------------+
> 
> Taking these constraints into account, we choose the secure region
> (0xf1810000-0xf181bfff) for the M-mode ACLINT components (MSWI and
> MTIMER), and the non-secure region (0xe081c000-0xe081ffff) for the
> S-mode SSWI component.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
> Changes in v2:
> - Drop the generic riscv,aclint-* fallback compatibles and use only
>    SpacemiT K3-specific compatibles.
> - Match spacemit,k3-aclint-sswi directly in the SSWI driver.
> - Squash the ACLINT MSWI and MTIMER DT additions into the patch that
>    replaces the incorrect CLINT node.
> - Link to v1: https://patch.msgid.link/20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech
> 
> ---
> Junhui Liu (6):
>        dt-bindings: timer: thead,c900-aclint-mtimer: Add SpacemiT K3
>        dt-bindings: interrupt-controller: thead,c900-aclint-mswi: Add SpacemiT K3
>        dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add SpacemiT K3
>        dt-bindings: timer: sifive,clint: Deprecate spacemit,k3-clint
>        irqchip/aclint-sswi: Add support for SpacemiT K3
>        riscv: dts: spacemit: k3: Replace incorrect CLINT node with ACLINT nodes
> 
>   .../thead,c900-aclint-mswi.yaml                    |  1 +
>   .../thead,c900-aclint-sswi.yaml                    |  5 +--
>   .../devicetree/bindings/timer/sifive,clint.yaml    |  5 ++-
>   .../bindings/timer/thead,c900-aclint-mtimer.yaml   |  1 +
>   arch/riscv/boot/dts/spacemit/k3.dtsi               | 37 ++++++++++++++++------
>   drivers/irqchip/irq-aclint-sswi.c                  |  1 +
>   6 files changed, 37 insertions(+), 13 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260729-k3-aclint-94ca9d3f818f
> 
> Best regards,
> --
> Junhui Liu <junhui.liu@pigmoral.tech>
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Bo
