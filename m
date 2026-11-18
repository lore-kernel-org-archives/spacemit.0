Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982547;
	b=M09OxiW2y4lxW8t2yuee4c7Fs26iYM9pLqZwF7lFG5IiOuDvKjd8VEXeSUjZiiEGJnty
	 ecdA/l8v5wJDYTriYlrQB6Xmzwt337WoBrtt8WY4OrxnbNkIhW606uUwVuTHU3WFSLvkY
	 7VtB5Q3SA1pJvTSpM4loZgNd+Nb47vcqH81ax1JscO4hEd25CNg9I1O0YOFVG1I7uL9DN
	 Kvaft4hKFXbVi2S1dTGLLwoFZZ3iyUGrfaPZ40252jJUH2q7lXHxJd+tceK+wcdHE+elq
	 BoTA9jtCCDIEHX3vClrlw2zJNvNFFYnKkwnkJ3h5i7Wbo4evlIfc+BHYtlApJAyjhig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6Ft0zvq/VRD49+f5G/aOWiZtloif8t23FAw9GoxQw9k=;
	b=fIdnIdgPhKi+sThLaoEVojvnn3ySokJnhyFlt58LiRC5U5yAnO+cHlrsb/l419CiTWQ/
	 snDxpGwU+h0GgIv7ULhtWustlcd/rjuzKLKuIxDG57josJ/Ky8eWMs0P890fvlPiihvCW
	 OlRqpEmjlP0my39sNy/WXClWfXqdbk5+hPv09fqK6ZzmBqRtYaIESTj2Ij23dIbE1d+Yp
	 Uqeg7csrnzHggtPhHozCKuofU3v9NYyLGIV/4b4Y+DleESD+HgZn4wXuZea5Tqy9bdhMZ
	 9eI6n9fsJ0n4XjZxC2WspzmMwdLEU140BZQdWN6xfbUqHABOZehR2ZxN+9nFLhPubvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Up2uG9b1;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ECE606A325
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 06:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05ECE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Up2uG9b1
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9d7791b00so5929945ad.0
        for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 22:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794982546; x=1795587346; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Ft0zvq/VRD49+f5G/aOWiZtloif8t23FAw9GoxQw9k=;
        b=Up2uG9b1AR/oWgfP7l+iTNhTHe0wyg7KYNID+5y47d11G3IQws0IqWkvUScWJjR2M8
         YMZCMMjOHSOiRAn8oFSNqGCaonX7ZTzNnQ0/VZ4IZKzxbmMqRsFMtiCEd9RGPTO4+lzw
         mE6u40NrMapwAsvQgE0ppsZysejWBO5ndWG9g4G1IKNh3QjRUTVkhvwczm5Lvr3Y6fAK
         rAw9BQuJ1SzF6Evrkor3AQmPd4PCEfaEJwrE0CpxYcLSO37ldYHg2frGTK5MBuXV9j7q
         82B6nuzh1+lqu2yqCrWMtadxeBU7Z2MWV4Gdre9XDPOl9Ne4MEUO9vM/Q2B3Nk3102cu
         hVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982546; x=1795587346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Ft0zvq/VRD49+f5G/aOWiZtloif8t23FAw9GoxQw9k=;
        b=1FkgFB/hzc56kenMJipVfvpM419FfShXHm1hfUnBWXXiAWFg1z+iZ30YzS8O68tNfG
         9QeeSbCTZoTlFSsjQ1qQMu41/IYTpKzWdF+x9DtRQhuhZIlvayjXKJOuCa7RRGcrUdeQ
         W33IrWcfDpegZzDK0svAOEOE4ihbUbc8mGwNBOTId5qff6hIL37aT003abip65MKFoUL
         Sri+zQc0MWELnlSU0LYfcxC9fKghcfQ5vsM0aqNVPhX6CKdoYCSYKdLETzx9zrrE7ek9
         W62hXKMoon+G1Hqa+gV1RGKgbWa3kYqClH8sCUMEv8dfRKeXtIPD81xtm9Z3ySuxLnZz
         Np1w==
X-Forwarded-Encrypted: i=1; AL+hErF9uRkQxd+aUiSLrYQNA8qJ1OB0CbO81t6L0FRGPZqmyF+oRa5COrlu776Fa9Zq6cHqB+6OcrjUUQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/rr41fXDgiW/yGltQ3lsa/aqwB9Q1x9ij72U2selvzNNA8enIh
	8YhqIHDVj3yYQAGeBJdUQ8ayom8KZulc+epur/QHmEbyMFpa5qb251FW
X-Gm-Gg: AZFdTZevDoPRlajS5UUtixi7LwZvmu4GNIBUT62BUlLyFYD+gfsQTGXwZD7d7Kjh+/f
	OEpBH1x1pBtx0lnSajnDYTRyLjHo1DhsUmiUcGJ71bIue5GoifzBOrhb3bRsNiRdFoJOkoIXFNq
	c/+zhyitv/0FSFNZb/NB37Sh7INi6+RVF2PUCpxNNGsnc4SbzSiEJjK+fwdUOFErMZMLSUyLdq0
	d6KWICqUqizf+s6nDQDiYH70TNjADEB+YNGjHw43IhMPgVmjg6RNLUssWeF9rIINK6o6m4Nefi+
	NvzZ/MeoCeaIZrPGqtdh+dkS5F8DJr6nIZEuTAfawXf3x9PoMKsLXwWQYpsgdTo7Oo7TB7I7ofl
	stw2vXFGucHSVlnWdVWUGOVJWxf69TBNh/66TF4uIXfvw57/+O4TuC+pCQt41aJdBd7fvSnyphi
	FnDyeZ/bxj2x6mzw4h/UzUqEfMH98HHXFgF/O0HVg5yqgt/wlaEKDaaa5xbw1kqMN2ckHGxmSdH
	Qcvbl1svciXhtswtG3a05I9NfEQxTEQQrY34LM1mLa+j8cpdPyNLB08PvWFHmd73WnX8cUMPVYW
	qNSOl8ET9boNbzPXiUcKrrHQGp+bFw==
X-Received: by 2002:a17:903:1205:b0:2e5:a355:56e4 with SMTP id d9443c01a7336-2eff72f4375mr13854935ad.11.1794982546300;
        Tue, 17 Nov 2026 22:15:46 -0800 (PST)
Received: from duge-G3-3500 ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e1295sm7508955ad.71.2026.11.17.22.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:15:45 -0800 (PST)
Date: Wed, 18 Nov 2026 14:15:37 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <ypx2d34mlq2a6juh77hpivaxg7eps33xzc45pvuvc77x4a332g@y4vjvirk3qj7>
References: <20261116075423.1519438-1-duge1256@gmail.com>
 <20261116075423.1519438-3-duge1256@gmail.com>
 <avzCmVhf8tl6hi_B@aurel32.net>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avzCmVhf8tl6hi_B@aurel32.net>

On Tue, Nov 17, 2026 at 10:09:45PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2026-11-16 15:54, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> > controller. These banks contain temperature calibration parameters and
> > other configuration data.
> > 
> > Keep the root key and SSK registers outside the exposed bank ranges.
> > 
> > FUSE_READY reports completion of a software-triggered reload. Trigger a
> > reload through GEU_CONFIG bit 22 with a 1 us reset pulse, then poll
> > FUSE_READY at a 1 us interval with a 10 ms timeout before taking the
> > snapshot. Fail probe if the reload times out.
> > 
> > Snapshot the shadow registers with aligned 32-bit reads and expose the
> > data in little-endian order at controller-relative offsets. Serve reads
> > from the snapshot and use keepouts for the remaining register ranges.
> > 
> > Enable the AES_WTM clock only while accessing the hardware. Leave its
> > shared reset deasserted on teardown because WTM_RST resets the entire GEU.
> > 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  MAINTAINERS                       |   1 +
> >  drivers/nvmem/Kconfig             |  11 ++
> >  drivers/nvmem/Makefile            |   1 +
> >  drivers/nvmem/spacemit-k3-efuse.c | 199 ++++++++++++++++++++++++++++++
> >  4 files changed, 212 insertions(+)
> >  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c
> 
> I have been looking at the code with more details. Is there any reason 
> to "expose" the whole 1024-byte efuse address space in the nvmem layout 
> (of course with some masking) as opposed to the 16 banks x 32 bytes = 
> 4096 bits only (still with masking)?
> 
> I find strange that user space has to know the address of bank 0 or bank 
> 7 instead of just looking respectively at addresses 0x000 and 0x0e0.
> 
> As the layout exposed to user space also includes status or control 
> registers (although masked), this might makes difficult to support a 
> newer version of the efuse controller which have a similar data layout, 
> but slightly different registers colliding with the bank data.
> 

Hi Aurelien,

I will use a 512-byte NVMEM space, with bank 0 starting at 0x000
and bank 7 at 0x0e0. The other banks will remain covered by keepouts.

I will also update the temperature calibration cell offsets in the
device tree to 0x1c and 0xea. The hardware accesses will stay unchanged.

Best regards,
Jiayu Du

