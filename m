Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.125.188.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793796214;
	b=12c+VU4hvOQxSGJZ/MYy4XkWalWofYKKNin7M56AqyjRsLbBudGkWzSXfd0ZDUhjkQPl
	 HbgNZO8SEPi2qiwTRGbxBlJOk1T1ornt7LLDBOqpS0lhp4hphkblN0s3X1Mic1JMftiCw
	 o6MG7U1c0QAv31CUpc1r3lrf9dim3Tnt6t6X/suUYe0tdpss+s7l5TOnE9ugykYkN+n2E
	 eqaJPyQvBsh+96Tv8U2W65m21hhFUuG2xJAGomB7sgzom0xGEJ0Uwm1QBXmiqI14UNdhT
	 qxcgZk0DqZgbpv/PJZSbD0ZLhIji3oVQ87l8uIJONI7c+y1Kj1Z5MFLvD27HtlL6L6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=KGzmHEtMcujY3rqdKLq4G+eIWN6ovjCAqdXSAfenRsE=;
	b=KxcidcmNR8IRtmE4ZFAc+8Y3S4X8LtyMwgQj2Qtd8d5BSEYP1gLb/VACt+/An29qTDwI
	 EHT2K9yY/fRokY3onyD2OpcXAJQ+prehUg0nuuriCBk2XMJ6XAGL1aW5vHSH/7eAAkeK5
	 yJKCxTWr9xhtftUo5tDu8oohpSL4Sbz8EhHoiJynZ42g/chdpVH7dw3HwrVwWQZ/5bpD7
	 ROMIpakVUb9z1Zh9+tu3iFjZwud+tbh1qdfvWV1m36nEPX6rOPh9dVAakorKWcj7HKz+V
	 M1QQZBEYbV71KjmL+9zP2+XR3GN+iFFPuAE03BDOf+pbEXHldxadgTtBLxf1VzNjMog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=hXxZf016;
	arc=fail smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795DD606A31B
	for <spacemit@lists.linux.dev>; Wed,  4 Nov 2026 12:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 795DD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=hXxZf016
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A87D83F161
	for <spacemit@lists.linux.dev>; Wed,  4 Nov 2026 12:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793796210;
	bh=KGzmHEtMcujY3rqdKLq4G+eIWN6ovjCAqdXSAfenRsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hXxZf016eSpDLt2Tj7WemwTlgaYoJAkq6Gnn4YR8wAPGuhCc+DaizT+tFyH5FtiwP
	 4yNQ8o/4FWDplsPakemx50DMT29VDiZkDd9BJqKKne8N7NV5O53bS2CX615y52/Jge
	 Yu3T/n82kd7ZtvUv7VgzaWNDL8iWRANQ+nElMcskVKWxS/H3B7trM0SNLLW9gdD3yp
	 2+VHx1lf8Zuv9EptTCY8/iFUY0NIuVYqwitq+tRZErxXC+7AoSEg9yY4iPMGuRyi3n
	 LogNavYInIaRxf4jI+m//5nIIL1h4jWCbjOKxVbMNlqtkiB1xeBryqSGaeV5XPM7EV
	 CkPC5Y33prVGPJwW9sFZUTDaX0yEF0rsGzkswtNgvnWuZIIXsgof2LuzOKFBc+8EXd
	 ygJVRQjXuEqQi/kpioA+mVrsN4A1V+RhkRwQEQNFa/5fYnruPqNl8WtapgOE3cYl3d
	 K21dtAPA9MVslCuTjnPYv5wc8bScyhyYbB6WQvTO04/37hhKTjNpoWNodlHwE4Zk+o
	 n9dxpNKaTc4axn8y7H/MaNnv2ylzzZv9EAHeSNO5XmuKYzNLEn5f7PoFPtTzKv/nke
	 oAmSeiXFTqlZ+OmWrOo/oCPS8eSdxCNEHGRXt3dt4+ZvPyu+Oo6o0gDmQUZsEjszrU
	 Fl/gzuqZEr5HcLMdtNI9ZkQ0=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c465c4c8da0so93331366b.2
        for <spacemit@lists.linux.dev>; Wed, 04 Nov 2026 04:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793796210; cv=none;
        d=google.com; s=arc-20260327;
        b=I/MPj8mMZc5dM6eRC/qh/JE7AFxpy18Bf40OrdTzH6IZxNTPF0YSuvszA09NTqG9BQ
         IwYSQfnyVvbswVE10RIYhd5xw4pnsy0232pjcM8a9D0Mjbs7lcRI+dndU9mvoxC/qGf/
         5oOO05rnHg+b1hX6gB3ll4sXueXPduTUhcrs4y4fwE0Z0RPH00eusrIhEsGvJJnCXFkh
         JOeGPwDZ3NDEi7Qq79jhMSb1z5P75vfrxSoeQ63oYaKamdF5M+SskrcQJOPlhq/Ai+xq
         K4zl1PzGfuiS+IRxrbk1ULWc9Y/c29lGvReofOJyaaenoRpX5ImWNecmJfPE/S0AspLC
         dcpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=KGzmHEtMcujY3rqdKLq4G+eIWN6ovjCAqdXSAfenRsE=;
        fh=/ZgutNTYPB051iIgfzGUMFlF6zH8MCgwzSaBMXC1KJU=;
        b=a6HKZmWjoyV62W0535nxi6hdkjBAasY4SxnQUgRv94OBbYUqcqetw0wgzbQi0z38YV
         8YCOi+I3dGMm6tNWKQFkFPJ5meNnD9D+/QMEeNFblxSXwPeUbg/UxMn+FOC3Y9HD9/Cj
         sZI2FwihWVj4195B4vgm+Kbdv5dxg2Y4QF2nDkPLOU4hHI8M6aXNHsQSV4txHe++dqF0
         nDMPeHUr230mFA2cfygZ6Bv8BdfZtWQ0X7i0d5WUa45CKQUQ70i3HFKpg8tgf5jrjUGN
         9X6smBBHRe0nBHjybMPj/wErsV+gdOXk9i9bps3awI5gDYZRj+m6qS20TFZS8iikPEav
         qRqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796210; x=1794401010;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KGzmHEtMcujY3rqdKLq4G+eIWN6ovjCAqdXSAfenRsE=;
        b=uKj6KukteRSYSO9B2txajJmYkcL5RXJX9ZZzY0FpLVHylT1YrecYqnyF+d55QWVuQi
         u0Z8ys0V4QF05em35UrJxlbw/Fc8sIg8bJUbYJKck4hueGop+ppSJxywov4c3oUTAzAw
         qo62nklrUWO5NpuO01/xPEAwMJ8AcNkQ9Vh5CyjNvHFPTOcRGJX5tHbInOt6gjQLByOV
         iY4KNl4hxTm5BAamOL1Ign103tK1aL7/mnXckuQGr2snjEafPe8fPpwQrwu+oB0s4jpj
         9u5hiG0rWVJHKczMix5VCICyX5ja3/nB7vNBXeRkKIFm4pbvxaiPHqLarKeiY9ZtElIc
         RXRA==
X-Forwarded-Encrypted: i=1; AKwUvByIMYNK0fOirR/QP4Uw5GxhcjG/niFrY4ATQ8FxSX4mf7MZi7XHMObtnMTE5MfISbZ8bDP73LXFUQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z97cyfOmTFxlqsZkrsy5Kbmlcz0JnD07KjpOq3ATuTHYnHlrorI
	VAcyuZ8IqvAU0B5ZG/frXu15E048Huje8nWvRWxoIDity+/OyeTKSws+3ESJJTaU72mSzXG8HiY
	vDgAltEtNGXCQ0+83YV2wvlR4UJR7Jo7G6ODc05y5IiAys890at/r6qF5aWZSpzT0m+PQ7rx5B7
	3hbPvc/ptJgSp5XJocNBIDRTuNEbJGrqUixzOiRgLSPDAYsQ87mYU=
X-Gm-Gg: AYBFou0HhJFYUptIhasKKHoUgiypSFWWevyoJoL5uBdTNa55eaT6XVpeierL5Lho5Dc
	FRW4V7iVRx2t4lgXt+gO5Du4uUr/mmqehezjlfljMfJrlg6qlMWDgvL9Zp8umswaTMYQYAV4GrC
	+TZ/DbqBvv9kBFfxWB//oeNqUZLLCo6sj++c/uh3qUf89sCkhA+FvqlIRpmcly6Om8dkO1J+ATH
	o4THbihMo880w==
X-Received: by 2002:a17:907:9098:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c4cc31d0c6amr700108466b.0.1793796210232;
        Wed, 04 Nov 2026 04:43:30 -0800 (PST)
X-Received: by 2002:a17:907:9098:b0:c31:c767:ae0b with SMTP id
 a640c23a62f3a-c4cc31d0c6amr700107266b.0.1793796209840; Wed, 04 Nov 2026
 04:43:29 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
 <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com> <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
In-Reply-To: <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 4 Nov 2026 07:43:03 -0500
X-Gm-Features: AclHuK9NNW0S9qfwpVQn7uKkEb-AwCUJMy4Mu66BWXEGz1K_BfAONgexdW5Tcwk
Message-ID: <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 13:21, Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> On Wed, 4 Nov 2026 at 07:24, Troy Mitchell
> <troy.mitchell@linux.spacemit.com> wrote:
> >
> > K3 BS01DCMA is a board equipped with a SpacemiT K3 SoC, 16 GiB of LPDDR5
> > memory, a P1 PMIC, an EEPROM and QSPI NOR flash.
> >
> > Add initial support for the serial console, EEPROM, PMIC and QSPI NOR
> > flash.
>
> Hi Troy,
>
> Thanks for the patch!
>
> I just had a talk with Dong from Spacemit. He tells me the BS01DCMA is
> the name of a module similar to the com260, only it has a different
> form factor and each module consists of 2 separate K3 nodes. Similar
> to how the com260 module can be used in a small carrier board
> (spacemit,k3-com260-ifx) and in a 10-node server
> (spacemit,k3-com260-tq), I'd expect to see a
> common arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi describing the
> module itself, and then an
> arch/riscv/boot/dts/spacemit/k3-bs01dcma-<something>.dts that
> describes the extra peripherals that can be accessed when the module
> is plugged into the server.
>
> Unfortunately Dong didn't yet give me the name of the server using the
> BS01DCMA modules that they showcased in Shenzhen.

Ah, it's called the Cluster Server RV2768
https://spacemit.com/community/development-kit/cluster-server-rv2768

/Emil
