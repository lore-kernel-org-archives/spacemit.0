Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794591325;
	b=rOQouLOSZRh3e9EblAP6zaSxBy27Z9GLjK1deLDQhMuFQJ7pJF/W5CTLuAAjDPZSFtux
	 Pi8ViLHiMGfFNy9bzfXIRSQ4y7Wf9YmfeTvtM4597lpyoNVFO8+4dyGlrUsJe1uNjKQbR
	 ZSA2fAX6pCjV1WX/C+9DCx5dyv/yJjLJPhBgOWTP8qLp//gXaQkb48J3Iuyv6vafn/ptO
	 7wCRzsQcRiQ7I8a1P0KYFtZ/7ytrw/KyrY/LVTrrLuXJIR37A3UWRQetbn7QBzN6mLq5k
	 QrdQVXCyJUiMdYj8WTTymRL7Ss0A9ldIp/5FZ88APmo81yy+Yw+UvBYFOZ8rthZ82mA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jbq0EeLMJFolx1OncOUqeneC72MUep198Aa3EF0wRf4=;
	b=4YXQqq9JqBk+198T8dKKcT8FIukyNcwLgJCSE4H3JtxbiksiXwkaTv1zwLo8MLCImDLb
	 oRMN8M2Tyb4OajeRH+Ej94j8QppdGnNodSytGwLGA6yhAlJr1r6A96L1fI93felmJiYe8
	 Yzv3p/j1C0rMoIgmosc7kvqgxVdDiBpCmKT8JqqnfQkJDzR02bmCIICD3qZ7Ivhzz7jze
	 wt8lCNpGpsp61opcrYM5Bl1mqyFdliRsE2Kn5/+TyLD2smRflQbvYZFJHgNRpjyywWSAO
	 mbI7/Ezyq6ll3V9nyexMNSVl0eCQ6eYEHFYQNZqqYhah4ndwUNhWheQsAVQA8NsdUmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3xeb5Z0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530C360776F5
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 17:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 530C360776F5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3xeb5Z0
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so297870166b.3
        for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 09:35:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794591324; cv=none;
        d=google.com; s=arc-20260327;
        b=Xxi6gu19OvrSjszSwWRDptCnra8PT7FDO0QEXJFkJ7Er23pHi9NHJey1AXh0kmeAXu
         HU4VslISVcKZ3K8KiyHUey7H4r/Qv6bXL+w9HCRRxJnLFuyTZIisZGBNfcJiKd1irdUb
         ptyj0HlhAj6Pk+PQYZ+mcwvQfSw6jEdhz1RP0pdpneLHfKB0KXkfJ1nOgfdWlacEbDDx
         kAjyi+hVgKRgbuTqLvGCbdeJgCF7boZ9e82tCS2gBbzivckrFkz+FVb01nvo/t00K6+R
         ajnAIRS9Csk5v2ij75fcImsmFp1vKnrH9rGYCTSvhsMb3mJcc6TxBX9PKjG2unCm+8kp
         EdvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jbq0EeLMJFolx1OncOUqeneC72MUep198Aa3EF0wRf4=;
        fh=ObjrZ9k97mkoYtEE+LqB7DjlCqDBYyobsbcGd//5ivk=;
        b=myDC3NIFDbPLwU03wniDKmEyAnB9ob8Gr9xSfBd5IW36TZHPugyWoDh3qoT0XdftCE
         LTKn1WOkKZyMgj79fICHX5REC2U9JpbLWSOgKvrLTkJgtf91lpJ0G77j6REaGg0EJBZA
         6gA+T46j+ods6epczt69WiF7Py/28SlpOX2ttVcDkwHANW5ziC8Q78IWkrab/EgM3ki5
         cpf0fXXVsPDKwAcId0Ux2N8/DHVFryUmXA1qbZ77WSZ9uNjcMbaMHWaGdsUzOUCwB5q/
         KL+nKXZl3TjD2AZY/6Rqw/rpvYhWfRuFAIPPQYI0D4KUicnFKFRuDcmhGLhLZkcJBw4H
         dC6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794591324; x=1795196124; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jbq0EeLMJFolx1OncOUqeneC72MUep198Aa3EF0wRf4=;
        b=S3xeb5Z0MR3a8GJrLOkMUVxFDPjbP5Uo4b3yYRi5HtiA4hW67112GP5BEJY9xyOEWb
         QtThQAYgAlmS8f8TupQR7Bh7aRmMxvlPHMA47e7F9hK/uFBGDpdZKL65I0V7PHFF7l5c
         gCssKj6q29MRtd07gDt9QwclS2FYXKWseqOZ6Q6e3Ifslm7KfV55UKPEnt5KxtmXWnNo
         p//lI9HG7OtUceK7p5at8V7nCxPqSL2BaqL3Dr0/iseWr+yM3cyESrqfFofazsa2gSAt
         JrGq8RMtz19pPJH4iH45m/InHcJ0adOijI+z4Glk7NkARNAOFLXDuGum43vC8X8ndE9u
         xDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591324; x=1795196124;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbq0EeLMJFolx1OncOUqeneC72MUep198Aa3EF0wRf4=;
        b=RrAVDhrrR3b4FdtTlQ9vL/6cNPfUuyxwihBerpnE6SyYdct/bYGMCZUHkzymTcjPhU
         CElKGioQAdBkTwittvlTnujp152AtWquqqiuC7uzH/mnQkH3q5jA+o6K/EKN+JEVoZ4p
         wWlqO6XCPyLeFDMqJmjJUfGfPSLJBDvpIbCZbfjdp0uueKORNvoHtaHoso9EnaOYoUmB
         pI+Y9OFzT77GkSJIzBdn7FOseIZHTmO0mtkz41zeipjKEJe//f9Ls3If2p1mSl8f8CDm
         ctQWI/A0G04BZb4C/PyvAYPgJMPmGLqrAR+N3dZP3Cvj3wMf61D6quNykIzxyupZUPQO
         8QYA==
X-Forwarded-Encrypted: i=1; AL+hErHrsWtAXLJVjiEk5kaIo2P+1y+9UDKcRvRHSg7ZJlqKx4TU9wJjdTNxKeXomPoNWPqZn8PnznEhpQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9cbf+w0BN08c29kPE3048jmgmJLv2C0cUOC4EabExRWfZV5OUZ
	aeDysi2KUTw+e1S6j1KDAbKEoVRFlj34kqAwTVI2O2WLu2yR4x+JxCyFTUCbEKeKZkzyrw3B8Ul
	TB4UuyskgvcIdFc+kiMVP+YQyc+Ktb+U=
X-Gm-Gg: AYBFou26FgrxCjCFYu0I//LHr0gJGZ/uM3C+Yo52kwdeOrb5wVERIrq3oIRFT/trSiN
	RyIJNM70d2AJbIoyBYMttWbIge7UeBWN85YD2vL4pkbJaE+tTsvA+UCJ9hqYEbITH+8SHj0ST/g
	vTjPFx+KNsZObZuKjTAqFQ+Ix+5fxVjI5R6E1zXyMuTRcuZAzVSKAHjkruJGst1zNK+cp1wavjX
	934nT+C8wnHX8i1JPDVk9VJhVV4udRYOLeubV4MMxKjsoYvoYg1NntkG2P5uYw54WGmBsPtYIPH
	mJ6CnPYa57HsyCcfA2MbhdJJ6T03bfVMwIH9eyUlJ6JyH9D81R30j3foH5Fgo6rZqtv8TIpPNGK
	yUwFKE96bP//IEWF/hh2zrJ73Of6SGl2ulMo/y3MnbD6VoBAoKmWMnH0mTdWbeoMla3fL/aFZF2
	kYAJhT5YvbQNDkXCQwM/y+Iw==
X-Received: by 2002:a17:907:7296:b0:c40:aa04:18d5 with SMTP id
 a640c23a62f3a-c50963075ebmr332428566b.15.1794591323523; Fri, 13 Nov 2026
 09:35:23 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113132435.434615-1-alitariq45892@gmail.com>
In-Reply-To: <20261113132435.434615-1-alitariq45892@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Fri, 13 Nov 2026 22:35:12 +0500
X-Gm-Features: AclHuK_ygvNFFgMQPh62rnosaTlcWUXJwDufLBrg6ePU0sUvfJ5AaEhA0kGAL9M
Message-ID: <CADqcGB=SFQu1F9zasFC8L3Nm8B+dnPG8UUewL8QitFY7bFuriA@mail.gmail.com>
Subject: Re: [PATCH net v2 0/2] net: spacemit: Fix TX timeout work deadlock
 and RTNL in PM callbacks
To: Ali Tariq <alitariq45892@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Tomas Hlavacek <tmshlvck@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, leitao@debian.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Muhammad Bilal <meatuni001@gmail.com>


On Fri, Nov 13, 2026 at 6:28=E2=80=AFPM Ali Tariq <alitariq45892@gmail.com>=
 wrote:
>
> This series fixes two locking problems in the SpacemiT K1 Ethernet
> driver.
>
> Patch 1 fixes the TX timeout work, which ends up waiting for itself
> through cancel_work_sync() in emac_down(), so every TX timeout leaves
> RTNL held forever.
>
> Patch 2 takes RTNL in emac_suspend() and emac_resume(), which fixes the
> "suspicious RCU usage" warning from phy_disconnect() on suspend. It
> depends on patch 1: suspend disables the TX timeout work before taking
> RTNL, so it never waits for the work while holding the lock.
>
> Tested on Orange Pi RV2 (SpacemiT K1) with a lockdep kernel: 12
> suspend/resume cycles without the warning. The board loses its network
> after about a dozen cycles with or without this series; that is a
> separate issue.
>
> Changes in v2:
> - New patch 1 to fix the TX timeout work deadlock (reported by Troy,
>   approach suggested by Vivian)
> - Patch 2: take RTNL before the netif_running() checks
> - Patch 2: drop Breno's Reviewed-by, since the patch changed
>
> v1: https://lore.kernel.org/netdev/20261105123441.2524171-1-alitariq45892=
@gmail.com/
>
> Ali Tariq (2):
>   net: spacemit: Fix TX timeout work deadlocking on itself
>   net: spacemit: Hold RTNL lock in emac_resume() and emac_suspend()
>
>  drivers/net/ethernet/spacemit/k1_emac.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> --
> 2.34.1
>
