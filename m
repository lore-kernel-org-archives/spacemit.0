Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D62E2BD595
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 23:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744414129; cv=none; b=lvpqAQA6xbI2P46Tv1NHtnmyaDNCSWpUxQHVWCpRiHTb6lpdbh9J67lpwo+qp4Rsv937QdWo3JU+IE+DSAo+mQjEp3Vv47qDNX72yBGaSfc6ZcXded2Ptc+gmDdtwzWOU/yN57ejBV49QTwc/14EEX+G+VXtxvWmkFOilNvnJqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744414129; c=relaxed/simple;
	bh=dSvC1EEFJ0pyt4oMgiDtpsgtB3ByVDFhaXNFrpFOr2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKtlmF0c91gqMrD6O4W7qXAMSc0EELU6Xkan4gLVBqHZuylMH1te4kFifcelLhXlaYsV8V7sz0nX/6nb8oct5Kj5uMU8wQKl/kXOkyZYHMzev0v+XbwGpXMtmBSx6uoBiXJR9XvLsXU6d2dpXrtyOEBzO9rLC4V+bVLtRu1nsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8CPAVdC; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8CPAVdC"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4774ce422easo25601801cf.1
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 16:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744414127; x=1745018927; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UvhHzpdybge7k/1xu+C8wVpLlcBQbPdkbGL/bYzd4aw=;
        b=K8CPAVdCc6/slVEDmGB5XARFWPcsX4JmKXpHkMSn0egMHib37ZIEI1QKrAJBpjhCQr
         MaHSBsloIfpjO7rGS9e6/yhLk/tU8ZVrf61qrBqgIXmCuAm+IVX+w71X1wFWniwim3XX
         K2BjQBVeXqFE0ct64zpbJYLshmPB3SlvY+rIVXDEVJdlVICp0J0qDmpYwjFmN/C9K2IK
         J/OJNHFJ/GnxfTxM6SFeriGGIzz8mNanKDjF1HX8T186ds/RtkQJy2OirZ612akhzFWo
         hbzrItbK58AucEagr7kZcRKn+PY/htbpMJmaM0iTjn+8umzs4FAzakDcb05Rbi/YQKfb
         sqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744414127; x=1745018927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvhHzpdybge7k/1xu+C8wVpLlcBQbPdkbGL/bYzd4aw=;
        b=lQ2uDeedvktz7MWkZjl/uu6dhllCa/jqWoTKiNFjCP+SP4YIi2fkL+SuMkSEVD7BYO
         jW2F+zGKhn5vQjim3naddORNrjNB5KkxnNDIewuDjQa8rFeQgdv6s/g7glRz5iGPPrXZ
         C6KijRO9Bkia2/jCm2M7YVP2y7gTBScfE8bw4231ehz3wqUB8Um7XYnDKL3d0g6OX/Qs
         ZCvmN3NkMpoh6LTKilK04JcYmsJmDTS/y8ooVtI5IPbs/BgFcD0hj3pN/V3YFEn02YTa
         0P3KQGSTtxyGkG6tgGUlihYkkazM21x6CeR/xgOhrdCb4DbEVkVCE/Vg1QGxcdh3Oyey
         vHgw==
X-Forwarded-Encrypted: i=1; AJvYcCUzP67mIwSk92GlJ74fn+epyRUsMqSsiD2VoEpl3mkPg/gILeq63Aib3v5SWA3+MEeeXQBMF1JmZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrqvDbIlYlgyVKLLwHbLVH0ScpKQ6QKxprvLh1twrhoLrwP+II
	21w/JLWRVnss127P/K2yv+sOq8QAEnxp/a///m1TTPi8IyIjBEQj
X-Gm-Gg: ASbGncvnhYRCXnVV9cgmkmByKzOXt8jvrjMKWcfNTqqTvXJCH7DEtVlM/z9bhz+EWnP
	xP7LNVddNE2HkRqOkSidSH6lWyCT9m2tpDyifYMEORIb9LXp58X8dyYwQa6EFvcauMAntaso3Rt
	iD6Xv+5YNhC5SUNzH1IF5A027N6zWTm/TpT1jvspszVxn93ctYq+gAVQDlL01zELGgEgw2KvEKm
	PRqhLY0AujAy+07hACbSWjU+7nhtvEMQe4mHQ71y9oFMBU6MKH3zCQVDiLGXXcQ5JA7xrhvhG4O
	MrIbvJxzVIQGD+hSdWcEZGwT05Y=
X-Google-Smtp-Source: AGHT+IEULaHSVU7/79T4sGgtSLDudJBk/aXEwPTYZC6UzLhe6HrogH+KkmZ3Al7QHscxwG8JxOb5sg==
X-Received: by 2002:ac8:5fd6:0:b0:476:980c:10a8 with SMTP id d75a77b69052e-4797752ddf6mr68207601cf.21.1744414126840;
        Fri, 11 Apr 2025 16:28:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796ed9bcdcsm33442711cf.49.2025.04.11.16.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 16:28:46 -0700 (PDT)
Date: Sat, 12 Apr 2025 07:28:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>, 
	Guodong Xu <guodong@riscstar.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, 
	hal.feng@starfivetech.com, unicorn_wang@outlook.com, duje.mihanovic@skole.hr, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 7/9] riscv: dts: spacemit: Add PWM14 backlight support
 for BPI-F3
Message-ID: <j35vjluiykbu2gxg5zkoxm67muj5y66zn6tjwhdbnolkyeilh7@cubjbzouewiy>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-8-guodong@riscstar.com>
 <20250411140510-GYA22364@gentoo>
 <d2c26d3e-787a-490e-9134-8ffe2f6b8333@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2c26d3e-787a-490e-9134-8ffe2f6b8333@riscstar.com>

On Fri, Apr 11, 2025 at 09:23:29AM -0500, Alex Elder wrote:
> On 4/11/25 9:05 AM, Yixun Lan wrote:
> > 
> > On 21:14 Fri 11 Apr     , Guodong Xu wrote:
> > > Add a PWM-based backlight node for the Banana Pi BPI-F3 board,
> > > using PWM14. The backlight is defined as a 'pwm-backlight' device with
> > > brightness levels and a default brightness setting. PWM14 is assigned
> > > a period length of 2000 nanoseconds.
> > > 
> > > This configuration was used to verify PWM driver changes, with PWM14
> > > tested and its waveform confirmed as correct.
> > > 
> > > The node status is set to "disabled", and should be enabled when the
> > > display driver is ready.
> > > 
> > .. see comments below
> > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > ---
> > >   .../boot/dts/spacemit/k1-bananapi-f3.dts      | 32 +++++++++++++++++++
> > >   1 file changed, 32 insertions(+)
> > > 
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > index 816ef1bc358e..d04b57ddeb46 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > @@ -28,6 +28,32 @@ led1 {
> > >   			default-state = "on";
> > >   		};
> > >   	};
> > > +
> > > +	pwm_bl: lcd_backlight {
> > > +		compatible = "pwm-backlight";
> > > +
> > > +		pwms = <&pwm14 2000>;
> > > +		brightness-levels = <
> > > +			0   40  40  40  40  40  40  40  40  40  40  40  40  40  40  40
> > > +			40  40  40  40  40  40  40  40  40  40  40  40  40  40  40  40
> > > +			40  40  40  40  40  40  40  40  40  41  42  43  44  45  46  47
> > > +			48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63
> > > +			64  65  66  67  68  69  70  71  72  73  74  75  76  77  78  79
> > > +			80  81  82  83  84  85  86  87  88  89  90  91  92  93  94  95
> > > +			96  97  98  99  100 101 102 103 104 105 106 107 108 109 110 111
> > > +			112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
> > > +			128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143
> > > +			144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159
> > > +			160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175
> > > +			176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191
> > > +			192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207
> > > +			208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223
> > > +			224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239
> > > +			240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255
> > > +		>;
> > > +		default-brightness-level = <100>;
> > > +		status = "disabled";
> > I'm confused, has DT in board file with disabled status doesn't make sense?
> > it doesn't really useful for placeholder, even worse that functionality may not
> > verified, so I'd suggest sending along with display driver while at it..
> 
> I think I suggested he include this.  Guodong tested PWM using
> a backlight on a display connected to a Banana Pi PBI-F3 board.
> The above numbers come directly from the downstream code, which
> uses this PWM consistently as a display back light.
> 
> But you're right, the exact set of numbers to use is dependent
> on the display used, so it's better to add them when the display
> gets integrated.
> 
> The pwm14 node could update still be added here, but that too
> might as well wait until there's something to use it.  So I
> think this patch can just be dropped.
> 

If this patch will be applied as it is after applying the display
driver. I recommend to preserve this patch, but move out of this
series and resend it as RFC. If this is only for test purpose, it
is better to move this into the cover letter and address it is for
testing. 

In most case, patches with some unmeet dependency should follow
maintainer's request, or has specific purposes. It also needed to
be marked as RFC.

Regards,
Inochi

