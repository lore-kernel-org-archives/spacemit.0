Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572658;
	b=WY/oT6n5eRbw9orZTULLtbaT6+YPRScBRCr4XbaUcElR7xZMS5fqVqOxGZTRTc/NPI3y
	 QND2O6ohpL2SliQk/NG+1CiMVf0m6rWck5TYzmg15DDW+N2DqFJUx5PKeA8gK4sGPZnEB
	 GUkHRuEip53tVZzYPExUoa5+AYEbyx23rtZQ8boXH5A0vFS4EcKlx9OSMn6uwFXanYwQX
	 ZNjWHPt+1Nns0VIMJ4E31+Spj8PYJP+gOJTmdhMttULXb9tkDKGpXLBt8Pegy8GPMHkMD
	 i7h5Z6KWDNu52FXCpBVn9Ki1xLeB0QOWWae7F4BWYXhdqyWDum8k1woW2O07d8MymDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=C/5+MwiGBhrvcZh2GunvS7SNbgc10mz9WWPVXOV6bJw=;
	b=4YQIr+THIWC/mMNHY5p65RdF71WnbOKsTpXpqIDIq1kSaw9hwZGgPBpwrU3hvo4N0uZ4
	 Fp6+VTN8rhTZLuGm91QftlUhr937+mn5PIav81/anY5Gx6Q8pd9cXEv78nnBFxSBlfVIv
	 tQNYzW/uY2uAjo0hgcLtrD950DatlUQoqCEdNuz+00ECItYj0wDbRCYaE6mYfFEHuaUU1
	 m3qapTk+6e3rlSEhejLcrpn86vzvde30k9ulCmL+sSrirqLPupcEdIv77gdzRv96UXgqN
	 J2QGT9PH4cUnX+Ctsz/UgYaYGO2j3lQknnb2hJcOUN7b/Or0m96KssddOh0Bl1oxHLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q+39W7e4;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6EC606A33A
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 12:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE6EC606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q+39W7e4
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3704d30b84fso1165340eec.1
        for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 04:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794572657; x=1795177457; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/5+MwiGBhrvcZh2GunvS7SNbgc10mz9WWPVXOV6bJw=;
        b=q+39W7e4qiIjWq+ckoBxOfWzLrlgJN+BZotY2dVbW3t5WaQDJ9+LnAt3GJ8fZw68UF
         G5jPNhauey2dLE/QsoiQHutO9ZbcvYIFhqYS3ENH0CjfdDwVQcnZLfOCZX0id8+wa3Z/
         rFKiQ8WvEBzDunQPbYNrSD74ebro6kMCKoW1SJ802rhVNEHLkRAphDZOk8Hqnn9wLtSI
         i6Frp3TJie2ICDCHbSujmrXy1b3K5Bo4zrmZ5JDWGto34XrilzfAbQqbsTef+f/xMsWi
         jZHkKWHgGQIs54rtJgOxENgBxjKGWpP3wxng9+XkYCuPMIX87zr+q7etm6QmZSM3HBkm
         OxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572657; x=1795177457;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/5+MwiGBhrvcZh2GunvS7SNbgc10mz9WWPVXOV6bJw=;
        b=WNtvp/Y6FgjUSLMIv82bIEbESKC9+2TonF6YQTZkovVIj7rCxia/aMx2SuK919rcBI
         K4OrhtpLubJSn9ZiYUPuWnwi0p4Lq+mcy2hr6iZK+VqqtcaHfsnnCDp2BlqySmg09Pkq
         G15myJq5sxh2Wgwu9xFQ/VnC9JdThp7BPBE2haEhy5peWDD4Ue/Pmp1loUvXmpLHcN0g
         +23FuGnr0+zQfD6HL5ODm8t7/SL+wGHhuP4UsBOPYZFhBpIBHcC256uikjOCRqnz76Qv
         hVu4XfOW0swZ93PY2y/U+9jyS/pGoXSTug1mvNG6qtX2Waru90mzwJ96L6SBVC1aWD8M
         uehw==
X-Forwarded-Encrypted: i=1; AL+hErGZgVtU+I7HsEafjAeY6tlBM1m8M4sKSdi9tqW4/OHSOz0IKXNMnjAaLtph3jPwD7KbTUmiYT6chw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9U2ctVvDsSjbSeUQbToMpf+HeIlETNHft6AzlPgn6WG9AnWgEw
	yuwurImhTWF54kUfCOKqenbM00MRFZJj+eKFd0vk7mrBmLIf80N/3HhH
X-Gm-Gg: AYBFou3QsWKH79mDchVqhpN/Yj1r9yWRWHicvYu7MC0CE/tlNrp0mJkyGPxsVHR6xzu
	sxL2T64DkYnR7p3HaWxcDSYbtNbipOK4ERWXOLMbf5hKc7RlOobWVn6nrHzy8mfzbucwXTic4xP
	bgX4FKZTMAkvfdofyiARjtOfmeCKm8Tp2BSWBNIQ7Z4NQS2b8Fp9wO/JrFNoPlufYUb+uj9fCpp
	b/T93pjUjwj9eld5n4tS/yPqloRvZQH2In3CsuYn6mfYcCr5w35yJe1OL7EMreC5taaM6RPb1u7
	tU83/SIFB+Ul5d+NxHo4oBrZbdlclqi1ChliqEYQe2araQ5yUOtcvhaEaa3F+ItqWfs2r6xM4nm
	yMFowwokS7ebfKYAsjojejwi6oHL/Yos1jd1Dkq01XEXfNzuWpidlJH3MQMeb5TcdEgjLdinL1v
	WOnp7ai5bow9PrircWSHJJ/RxgUklqlWDHhd/ep/s40Mpw+5mgOTThrfQ9210/CJix13ETziORz
	IVck6fTNFns7UUYjFLqqvf9Q3Xzt7gQWoTS9rLlZ+c5pj6p4t9pvZ/8K74o+CPefmrcACRB8iJc
	YfkFjVw9UFr2Yf8XLMdm5Hz7nOsUcw==
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id 5a478bee46e88-379682c2053mr1692885eec.30.1794572656803;
        Fri, 13 Nov 2026 04:24:16 -0800 (PST)
Received: from duge-G3-3500 ([183.192.220.187])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm7242488eec.16.2026.11.13.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:24:16 -0800 (PST)
Date: Fri, 13 Nov 2026 20:24:05 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature
 trim cells
Message-ID: <uot2mqhilzdfngqcwpipdo5xzncyvesmw2hw6rqk7mnveer57f@6m4cqzotx53k>
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-4-duge1256@gmail.com>
 <au5Q9lYTUegeEglv@aurel32.net>
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
In-Reply-To: <au5Q9lYTUegeEglv@aurel32.net>

On Fri, Nov 06, 2026 at 11:13:10PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2026-11-06 14:05, Jiayu Du wrote:
> > Add the K3 eFuse controller with its AES_WTM clock and reset. Describe
> > fixed-layout cells for the temperature calibration parameters stored in
> > bank 0 and bank 7, using controller-relative offsets.
> > 
> > Leave the controller disabled for board-level enablement.
> 
> What is the reason for enabling it at the board-level? AFAIU, this is 
> part of the SoC and does not require any board level hardware. Therefore 
> I believe it should just be enabled by default.

Agreed, there is no board-specific dependency. I'll fix it.

> 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3.dtsi | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)

...

> > +				#size-cells = <1>;
> > +
> > +				soc_rtemp_trim1: temperature-trim@120 {
> > +					reg = <0x120 0x1>;
> > +					bits = <0 8>;
> > +				};
> > +
> > +				soc_rtemp_trim: temperature-trim@19a {
> > +					reg = <0x19a 0x2>;
> > +					bits = <4 8>;
> > +				};
> 
> I have tried this patchset, and while I can see non-zero data in the 
> /sys/bus/nvmem/devices/f0702800.efuse, both temperature calibration data 
> appear as 0. Is that expected?

I see the same on my COM260 Kit: both banks contain non-zero data, but
the two trim fields are zero. The factory 6.18.3 kernel gives the same
bank data and temperature calibration data. 

The thermal driver change in [1] reads the bank 7 trim first, tries bank
0 if it is below 8, and uses 0xd8 if both values are below 8. This handles
the zero-value case. I don't have an explanation for the zero trim values
themselves.

[1] https://git.openruyi.cn/OERV-BSP/kernel-spacemit-k3/commit/334d70cf990d4e9a9899bdfb758e47732ba5d519

Regards,
Jiayu Du

> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
