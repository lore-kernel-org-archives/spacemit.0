Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3B5335071
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 05:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765862539; cv=none; b=ugN94xj3V58uW9QYoHKklsZp4leXtlcPXV3i95VkRY4nRkNwWohbkxhKdSs+HNhgiqqyKG6bA04ard6X7YfjN+KoxT9f3hcurwscxbndtLLfm+dwaDvvAsjEngxiiipwIG9jF5mSFsF7vFlS8p5ghA5EChezYcIZYcAz1o1pvE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765862539; c=relaxed/simple;
	bh=3bfVF7cqEIEY6T2vhjKvm3WS7PN9zCOvWF1W1Amy+0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nm4Fb1LshIGqr9mxbixGEBjgsCcJ5qS4Ue8FIIJmb3guRj5UmnbUUyiLQwFJl+2lpcoTh2opKbQbjgBMM9Pu9Ef+P7AMTI2SbngOWEsDN2LaaGEviAu39gg7RhUKZNihgjyNEvM8Aluuvrt888Xbs84XtPzBSX1dVDpc4tBcvPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dM1DIOlv; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dM1DIOlv"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34ab8e0df53so4455210a91.3
        for <spacemit@lists.linux.dev>; Mon, 15 Dec 2025 21:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765862523; x=1766467323; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g0IdpBtg/JhdmjSRlVsZcTYVx5UhfvoA9V35JLo5kNg=;
        b=dM1DIOlvMliW6S1sdpnpZ73KU63zJgnguR0vz9eAdgNa/UfdVzKb5Qr3Ihmrz0sB6b
         oON9p/1dhCY6oHPQVdD4JSXpaPjMsYdwW9dw19KouxEJiWxSKNYChSKKAUsl8aezpO1k
         u3nYNIROIDmTfeUBMWMaTEz+A6NIJGHfCOEQR9ULyQZKLjpMHZCWZ7tMoz+e2SdcI8xG
         kTDdYu/Z9PnubvaSswhLglbzvtK4ZAykEe44+DQZRjm9MA7yEapkAuQ52kLwdM33czO9
         7sVAkV2R1Fhh2XGj0MX7I27uPmVQMLRfr7gGVhhVPh7TAoEx1hpPQa88oUsAca6lj3pc
         rGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765862523; x=1766467323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0IdpBtg/JhdmjSRlVsZcTYVx5UhfvoA9V35JLo5kNg=;
        b=csxVigwRDZy22U8+x8SpIo3IHpFISQlUmCQU7yGdT87GfRy/TTGuDJn+E+55nMRyN1
         tNc/PW7BVA4E71PVVqrGcqa5KI1Nm+sg/wfv0GuALfNcqgOu0Z6FquVnmq+00pRa8q7c
         dS62YwYjl7h9zQwxH8b4ogiZfNbIiF6/7FNbOAjKus9hsW4FY45V3O7h17EuQBY1roRX
         yczh7e3yL53RoCQY4B5mjl3nlSPU7Q2yieDbNymzHg9uQbLDvrfhLA+Sogr6rqQ3bZbF
         MmqYosGfiEbYKKeYBgcyzs2Eu/cXvypqJ9mlEz2FxIxxLteELQ738UmiuBh2BZzYIJ8o
         612g==
X-Forwarded-Encrypted: i=1; AJvYcCVR0qAHqsvTMBDsGEgNyJv9r317SNWGFeoTU47xJnr11MjsT3MoOvkV+balNi+6Y/f7tlwTbqNcYw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn9TreZGmz7nL0I+EjbyLDqhfjpz+8o9RmnTbr5OVoicpfZ2vS
	awp5kdI27ApHtEEA7WoW/PEUt/8NlryCF2DQOLrhE6ar6nKiuSoRj7MP
X-Gm-Gg: AY/fxX7NUXMexPTfqqPABjSJqoa5ByMqrBc57RB5czhRn6EC1ibvb81OYsAziqccMXy
	7zZjrC/B/hhXRM6E7yMsa018HKNslxSoKXopq1TsTp4fBYHkwlC7h/DIvpCWpbKGEnk9egglMmF
	/Q+eguETmxeLnyEJQ7TPQDiXYkgZySKOd+jHZPV6FJq1ADOfP/zFG1u68WvF1UjnjK37IZ/7xzB
	+yaUsPommxzv7jkUx7AOttdD0kKPOcyNEj6ncnY0q1ezltSbG1pde3pxGUUicgkh+K4JssinDZE
	W3UTRVkPeu7rCU6jq6FbnGeg4Uw5rNN8PTbglXO6UdpBQ0IgitYvxIhHe6LzCy4dbytRvxgK4kn
	N1elsa0VM3KvwZdrwuI0O0+Da+tpAolErAXs3fGR3vpDRIKXL0YD9rKhK+KN35/BA
X-Google-Smtp-Source: AGHT+IH7rgc/KiTJTKPFRn//6KTwpo0aXlM6RPxFGdwYRhguaslwU6dfICFDwUD8TCCvmZpUxPVrDg==
X-Received: by 2002:a17:90b:1fc6:b0:349:7fc6:18 with SMTP id 98e67ed59e1d1-34abd6e0193mr11861601a91.13.1765862522998;
        Mon, 15 Dec 2025 21:22:02 -0800 (PST)
Received: from localhost ([221.192.179.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34cd4bd9987sm109226a91.4.2025.12.15.21.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 21:22:02 -0800 (PST)
Date: Tue, 16 Dec 2025 13:21:56 +0800
From: Encrow Thorne <jyc0019@gmail.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: alex@ghiti.fr, andi.shyti@kernel.org, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, devicetree@vger.kernel.org, dlan@gentoo.org,
	krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de, palmer@dabbelt.com, pjw@kernel.org,
	robh@kernel.org, spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com, troymitchell988@gmail.com
Subject: Re: [PATCH 2/3] i2c: k1: add reset support
Message-ID: <20251216052156.GB6413@hailin-HP-Pavilion-Laptop-14-dv0xxx>
References: <20251119-i2c-k1_reset-support-v1-2-0e9e82bf9b65@gmail.com>
 <20251211073526.3164875-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211073526.3164875-1-guodong@riscstar.com>

On Thu, Dec 11, 2025 at 03:35:26PM +0800, Guodong Xu wrote:
> On Wed, Nov 19, 2025 at 07:46:44PM +0800, Encrow Thorne wrote:
> > Add reset control handling to the K1 I2C driver.
> >
> > Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index 6b918770e612..64d817d8315d 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> > @@ -10,6 +10,7 @@
> >   #include <linux/module.h>
> >   #include <linux/of_address.h>
> >   #include <linux/platform_device.h>
> > + #include <linux/reset.h>
> >
> >  /* spacemit i2c registers */
> >  #define SPACEMIT_ICR		 0x0		/* Control register */
> > @@ -113,6 +114,7 @@ struct spacemit_i2c_dev {
> >  	void __iomem *base;
> >  	int irq;
> >  	u32 clock_freq;
> > +	struct reset_control *resets;
> 
> Thanks for the patch! A few suggestions to simplify this:
> 
> The reset_control structure doesn't need to be stored in the device
> struct since the devm API automatically manages the resource lifecycle.
> 
> >
> >  	struct i2c_msg *msgs;
> >  	u32 msg_num;
> > @@ -571,6 +573,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
> 
> Please use a local variable in the probe function instead:
> 
>        struct reset_control *rst;
> 
> >  	if (IS_ERR(clk))
> >  		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
> >
> > +	i2c->resets = devm_reset_control_get_optional(dev, NULL);
>
  
> There is a new API, I would suggest this:
>        rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
> 
> 
> > +	if (IS_ERR(i2c->resets))
> > +		return dev_err_probe(dev, PTR_ERR(i2c->resets),
> > +				    "failed to get reset\n");
> > +
> > +	reset_control_assert(i2c->resets);
> > +	udelay(2);
> > +	reset_control_deassert(i2c->resets);
> > +
> 
> Why you need to call assert() then deassert()?
> Wouldn't the single API fit?
> 
 Good point.
 
 Thank you for your suggestions, I will fix them in v2.

 				- Encrow
> Best regards,
> Guodong
> 
> >  	spacemit_i2c_reset(i2c);
> >
> >  	i2c_set_adapdata(&i2c->adapt, i2c);
> >
