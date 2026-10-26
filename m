Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792993135;
	b=3oRxWdbJPfiK20AM/7AB3TdeM7lAL8yvsOKkWAUB4biumXnNnnwpQiuvex8lkJyXmJaw
	 AjFe2PrrCM34FsD6HkyMIOCtEyp4WrG/W+NF8h/7az5S+SZ8Km44hBau+4SUUkQh8UqBN
	 fL5oOVkDRO7cU1dDPAL7YNvSxka6Ha9WY0x57CBh0b5bq7jsymhZhg5+sWI+tKMHHjzm1
	 74SFcNEH9lG/LlnL9bqB9WTdB+Ee4ZP9ZknnB7FhNxHlD6Yr55iEMiRd0jrzzO2uOGl7F
	 pMYCAIYhueMMDZMwF4T0E0xygWWt61aDmIcHN+KlsD9yJ4Atzzm9xhcLJwGEmXC1QBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KRC9z7Hf6UT0/DB2ko9R8MQynM5giNRybmjOpJEixmM=;
	b=4Y9IJYrxhP1Thi5fKiJSOFUv+AZO+wzqfsJJ0nQ9X5Xj8DE/WWwbwGSeYFJU2LatmfSv
	 l4WbL/lWIiFh74eM/eib7hJsaJKjVjaKds4z3aXhZLOcu3MKbZHxK4mjNvDB2KsI2HTXM
	 awVPtXIWGl20tu1SyBM9WJWvm+E1yZRRSRnowzV1IG02aYJQVbxBvrKdFW5/GoQJL9lkv
	 pKAiCq8gzJ9v4S+cUzmvbjLQ7OzGSRXoPGS7X8PUci6quW30rTqmq3S0K798JdFG0yEl6
	 cpzWrz3sa6+pB3Xe/Hu2vYLEmXCzQEWvD5NIr7/yQ9yl4tr5kAvGL77LoKn4VOQVDQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q76wuUGO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B2E60A380C
	for <spacemit@lists.linux.dev>; Mon, 26 Oct 2026 05:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02B2E60A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q76wuUGO
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso3958005a12.0
        for <spacemit@lists.linux.dev>; Sun, 25 Oct 2026 22:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792993133; cv=none;
        d=google.com; s=arc-20260327;
        b=XyhhAOtnfv03h+5Aux+1xsn2JYWSdcnompRhbFtk55lIuwGwLCRbHSisZrDqA78dzf
         gOO2MVL69eFb+VN66nHr0ZF/TvzvPiLxPn6XuyTwrONV4ZUqWWbYs953ahiVm/HyyMNE
         6PQvGCuMnSiyMLONIt0yvmZRIqlLIsoh+H/bfx9zyVhJBh8C/AH6UBB1WFsZN7nOO6UZ
         +rE7n3/tY0XnHcBPQVI/l2tWAtgqxi/OzBLTAHrhK2N2FxBrfTCrfK98dS4Fvb448JWd
         GgLvLKgy5jqVgYZWWrqzpKrYaXqfnSOV6TuwBj5LDDefaiZdWmIGteWybQHdTZhXsGLX
         bJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KRC9z7Hf6UT0/DB2ko9R8MQynM5giNRybmjOpJEixmM=;
        fh=NqXF6V3hlOD4R15dMTvywMGCecjEGk3vJkJAjDuOMsI=;
        b=GqyfEbQgePD2zgkkj51DXNFursrgA4R1rIrNRTJGfFAEgOdazKNRXo3+w28Ke+WL4X
         pK+ePvptoWK5+vznwMwEdqUEGP0T3xqsQ6nmMsx99apSv0M7OaETuuYnkJ8eqsIK4yrY
         lERK2LvmLmurDg55hoVbNg/6UfPGmla+1Mm20FleGs7rM7J276KsW1mGjfHej+IfBcYe
         AFiYRDGJQ7tKa/nVxX5bI7keMXXqmfjee1qSUA/BRCb7icuPWDJzZ9B9rKRJjkbyLs4F
         klA3l5DdkM10yUGYaqrD2rQ9PyPaOiIoSf4bYZNI5NxVmAYYyndGaRJydbE9q5FeHjJK
         S5sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993133; x=1793597933; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRC9z7Hf6UT0/DB2ko9R8MQynM5giNRybmjOpJEixmM=;
        b=q76wuUGOSfP+TyD7J6hKF0Oa6/2fuiQkBkuHvMRcJzIAZHjOhxcJ9Yx4d/WiI2NVGi
         M/NbiGf5MuGa8bAvZ+PDdac4Pzydmtue8/cj6afaUidJ6o6hgGaJYLOaAra7IwMvLFOi
         3MjWFXN+fEsv/ldfTjipwFwxKfQrrj18cGpMIKvTG2lvUMOzmW4aGrO9J8HRBmDkY1he
         63Hb8EeZagwkZzQKfURwP1CMb+EGCe0XEK99cPhOZKsRppTtdBTsCx3Ky/5b48OxmNDD
         5KqB7lNkxcX6BZI9T+I2MYgMxzHylh7AZdhg7X/qVyYslnmPStFIfKk6dVy3yejvFe6E
         qHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993133; x=1793597933;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KRC9z7Hf6UT0/DB2ko9R8MQynM5giNRybmjOpJEixmM=;
        b=KQ6NxVrcCwVnj39mf3H+mrevrJSW514uG6dAEV1r22pUXlTwboPjq1ZW1ZYEWuwW96
         TiMAW72NEx08rAsvTTKjPcsovIVHhIR3ZPEJI6b0TpA29AATCAQ8kS5/nlj/b4ZJkMD8
         mECCu8wqqnnLnCAqYJOBLE81uhiKjemnI6WRKSmBG04c7pL9R60TdeZOqD2GFmd8VVJF
         1UD4ibeEg3+OQ9zqTiC+88PIVpolXOzK+GSSkSSduAs+b4HUlKugCjvOPtGvHuy9876V
         r06QlWenvtGXLi8I+WEWMYM1V8JeY9JD10s9XWAOpYhtHH+jum8hTAf5HQG/S8iUKL0c
         MM+A==
X-Forwarded-Encrypted: i=1; AKwUvBzEzjmw8IcmMM+lbIEVsWYIP0Lz5HFekhTom6JP6r7u+XjRYyDpskbr0PrAJ1NRNPaf7iZYWQPUCA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJye7BhB7yjUDNoKYDPosyONNoyMNedP17AsfUjRlkH2jsrrx5B
	yoZFhwP3QxjBbyBEj8FHo6vOWsa3QUT8w430N8T6HJjGxMzGOsW6W17Dvw0ze5aAyGo2Jj5KfzH
	hOapWFD0xHmtYCoa8FnpTFWFQBswWJs0=
X-Gm-Gg: AYBFou3q609fnt8tWKIBdttycSX4vuXjR2aB/WpDgx4lhVz4kFMc2xCTp6MDXeLBRJt
	F8OhkGp95iKKGO9+YVDWSudoLMFMspCSY0SSrHdoy3ePfjDRYBOg0ILpUs/gLIrXa45nP4Eu9Jq
	PfxdP7s6J34gjxdf46+mdSlbSzSquX/msLKdhrL6zQ4bUhhP5vqQ+l/fpYYMXqBzvLmaKTBlISd
	l0VmBASUj3q8gz/tO6y17G0mVMrkioTwMqb64w/57hpJSXRAnnr6t/hvRlJ9NF4TfE4H37CONZ9
	gdf9v4g3Vl+M6lSUdy0hK/On9bcr4rn1NsCNxFttlr1hiKZ6mpA6jz2DwQ04c3umgFUJeDZ3wfd
	fDXBqw27Pi3n1PV1ucykZB4cFEJuuX8gt61E=
X-Received: by 2002:a05:6402:5630:b0:6aa:1112:62f2 with SMTP id
 4fb4d7f45d1cf-6b442fcb0b1mr5488509a12.15.1792993133095; Sun, 25 Oct 2026
 22:38:53 -0700 (PDT)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
 <20261024092558.143621-2-alan.tseng.cs@gmail.com> <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
 <20261025130206.187282-1-alan.tseng.cs@gmail.com>
In-Reply-To: <20261025130206.187282-1-alan.tseng.cs@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 26 Oct 2026 11:08:36 +0530
X-Gm-Features: AclHuK9RjSFEksyS7-_jnVXSvRIxT2GkoKRYV9Xd_PqlQ07C_F6NfX7RJdwzzV4
Message-ID: <CANAwSgTiSiEfdLD7yUwcbFnXfRpnSNZu_GXLnQnXipc+ansnPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC
 nodes bootph-pre-ram
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: dlan@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	e@freeshell.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hung-Chun,

On Sun, 25 Oct 2026 at 18:32, Hung-Chun Tseng <alan.tseng.cs@gmail.com> wrote:
>
> Hi Anand,
>
> On Sun, 25 Oct 2026 at 18:43, Anand Moon <linux.amoon@gmail.com> wrote:
> > Could you update the pinctrl and GPIO configurations, including all
> > necessary pin
> > assignments, to bring up the SD card, PCIe, and Ethernet nodes?
> >
> > Please ensure that the required bootph-pre-ram properties are applied
> > to the relevant
> > pinctrl, GPIO, and other dependent nodes wherever necessary for SD card boot and
> > SPL initialization.
>
> I'd like to keep this series to what is needed before DRAM is up.
> PCIe and Ethernet are not used in that phase, and their pinctrl-0
> entries are already in the board files.
>
> For the boot media, the BootROM has already set up the pins of the
> device it loaded the SPL from. U-Boot's spacemit_k1_defconfig does
> not enable SPL_PINCTRL or SPL_GPIO either, so the tags would have no
> user today. SD boot on a Milk-V Jupiter works without them.
>
It is partially working, but the current approach is not ideal.
I have made some driver and configuration changes to get it working on
my Banana Pi BPI-F3.

The main issue is that SPL_PINCTRL and SPL_GPIO support are required
for board bring-up,
but these options are currently missing from the U-Boot configuration.

Here is my u-boot logs with some debug prints.

[1] https://gist.github.com/moonlinux/a491bf56bfa914e4bf5f661635eefe9c

> E also asked on the cover letter to keep the BootROM part and the DRAM
> part apart, so I'd rather not widen it.
>
> > Additionally, could you update the regulator-name properties for
> > vdd_core, vdd_1v8,
> > and vdd_1v8_mmc?  On all the boards, the SPL code requires these regulator names
> > to locate and enable the corresponding regulators during early boot.
>
> These names come from the U-Boot SPL code, not from the board
> schematics, and U-Boot already sets them in
> arch/riscv/dts/k1-bananapi-f3-u-boot.dtsi and k1-musepi-pro-u-boot.dtsi.
> I think that is the right place for them.
>
I have made some changes while integrating this patch series into U-Boot.
I am following the approach used in configs/starfive_visionfive2_defconfig
to keep arch/riscv/dts/spacemit-k1-u-boot.dtsi as minimal and generic
as possible,
focusing only on the essential SPL bring-up requirements.

> > I am verifying the changes against the existing U-Boot board device
> > tree and configuration to ensure
> > that SD card, eMMC, PCIe, and Ethernet initialization work correctly.
>
> Thanks for testing. Please let me know how it goes.

The goal is to move most board bring-up configuration into the
upstream device tree,
allowing each board to enable its peripherals using the existing
upstream configuration.
Once this patch series is merged into U-Boot's dts/upstream/, we can
keep the board-specific
configuration minimal, avoid duplication, and reduce the maintenance burden.

>
> Thanks,
> Hung-Chun

Thanks
-Anand
