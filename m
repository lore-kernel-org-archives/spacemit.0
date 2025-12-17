Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DC418CBE1
	for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 00:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765931703; cv=none; b=XfSlZ/1uzmtmZVNg1uiYf7EnZEzqgXJGVd36Uc51nf/0jdT+0qQkdHvwnE4skmemoZ/Z3iBERERdg0djAxKdIwh5H4iLHABDd5shJhOo4HJeVxZVatr7xRB5yzXGUANuv1URYK3FqUKskAVrymyk59+yLMT2QUNapIanrveT1Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765931703; c=relaxed/simple;
	bh=H6JE+FW+WsCz+DgYOHrTa/gcRRdjdcnICYbIAK3fl2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjZoEPjrGQbrR59poRhUixQYQBunAbL/8H6mu93Bfcz1fGyqoZRALyvsOnlFCHhKwr6aq6ihZkdex8Ky8sAT2BfFqw51v4nU5x/wlNDoTKfxOTrm8IxXVy9s3w35CgdZ7ZDUI/6Qu/umxESQck/bMlGerxd3Khv+WiwlJARIgX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRozCq2P; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRozCq2P"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so3552575a12.0
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 16:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765931701; x=1766536501; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I16GnD6fZp55p7NM5OBmJZlxxa+Of8TIwfznHTqHcjM=;
        b=ZRozCq2PrTB2AAAKZDROVW5hF4nQWCz5I6/Wkwv1DlocRNsQjqSGmUZDCGDVaxUqoL
         DI5qny9cQXsZS7RT3dqcUtKYJZON8A5F48TXxkBFHyoQfcZI28BhyewS6crNw5SNbsr1
         8a/Rnn5IIvGK3fi+ypOcBu/s8Ot5ssu1SeNx3AHV9ARmdE2RRPDxqhhMoAOA6QNP+9af
         OiGEiljU5VBFs5hth523iCRK6TU6KoHPZ02hd0qvsDt9vZBBBLRWIvJOs6aq71EwSnkp
         Hr0ro8p+eMzkA99qMo2gG3GKI/c45hLjzBTbmHQfZOnnaOuq+bVO8FAcmvA8Kv4/mnSu
         5aFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765931701; x=1766536501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I16GnD6fZp55p7NM5OBmJZlxxa+Of8TIwfznHTqHcjM=;
        b=eS58LB3c/5MPeD4ACu5oW6sRuLlEoysqV9MVv60RcHO87KpiqWTwkpSez3xP5OSvgD
         mnABjWvrvrv2vHmkXdIHHGl3Yae1c+obVrYKjUpIXj/1+5X9SUYbtsoni8VTsZI0vF61
         C+dtGHvNwrZoihFg631tqX+2fJ+iMNvqeUwa8O0ezlLDkk8KVi7xVS/F/iAEzoIs9dKd
         SvMclIB70ouKAzLLZ80gdvrbL3UK6UDaFK3y75DYiq9Y1ekbPPU/qwT9pG3HMHZeeEB2
         +8zBoQFgejt89pfkPSNEUa919Ew+AT7cMpmg6CZYBwiPjbTy887RzF5wRtRFY39Z+y3i
         5waA==
X-Forwarded-Encrypted: i=1; AJvYcCX0F+kI8jo+6jrnjB67+3HMzPyk1kVYZAMt6YKghkVWxBPp1qfmg+a0OewLtby2lvOLUlh90g5I0g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu6HxVy5EG/Xf7kdGrKH++5gQOtDXhakutt/l6YnE+mDOdM3+x
	ZoEx7SdPprLrKsuh8nGBJK8Q/woHoj3xXlJY53cFaPWUzjmBvLFf3+JJ
X-Gm-Gg: AY/fxX5nZgLH9RztNywfsK22bbsGEpPKeOMLua7GGhVvZfR2x6CUcBW4KMGpYasMHoH
	K4PcwKwCmRmH5job9ECorpJZTEuhyCLjbcpVsZXu5R2RuDrH0y4LwjxuOAOmlDhxWeQbllR6jjv
	DSzFg9u8suph5wpgTT1mltyW5Vn+UDyYENVUW5I1fDROevp7RniEC9g6aJW30lgYOzFJpsFTqiq
	rQ0EzznGMuvHH/n6gnvs4tgZMD7JYbm1W7OsuexQhvaWPZcWwFVQdXzGvjq4srLSlmRwdvOXfjk
	Wy/nRJidVd7UYy3o5321ShlWsGa/q189hTGcpjnKBB6MXRG/NghsAcMmgKSYqhu85iwxwbuMs3d
	TkZfzZ5wJfRTqlwrq0XvutZGAU41UOP9HxAR5LGBs08RMOflyg3Sgmq9AU1qn5sNHUzapbHsZpm
	/KFpSI2MiQ0Q==
X-Google-Smtp-Source: AGHT+IForQc0D2tDs5AEskKGH8DsPL45V5wktJcbV9kRoh1ELjnGuofFRcuE+2hAQcJLnodC7x9ehw==
X-Received: by 2002:a05:7300:cc9a:b0:2a4:3594:72d5 with SMTP id 5a478bee46e88-2ac2f86daabmr10134969eec.4.1765931700780;
        Tue, 16 Dec 2025 16:35:00 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ae4f054619sm1918117eec.20.2025.12.16.16.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 16:35:00 -0800 (PST)
Date: Wed, 17 Dec 2025 08:33:57 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Longbin Li <looong.bin@gmail.com>, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2] clk: spacemit: Fix module build for spacemit common
 ccu driver
Message-ID: <aUH46Rqb-bzsqUn_@inochi.infowork>
References: <20251216233514.646263-1-inochiama@gmail.com>
 <20251217001833-GYE1903981@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217001833-GYE1903981@gentoo.org>

On Wed, Dec 17, 2025 at 08:18:33AM +0800, Yixun Lan wrote:
> Hi Inochi, 
> 
> just noticed, you failed to CC to the mailing list
> please increase patch version and send a v3 next time..
> 
> also please see my comments below
> 

Yeah, It is my mistake. I failed to add cc/to with git send-mail.

> On 07:35 Wed 17 Dec     , Inochi Amaoto wrote:
> > For build spacemit common clock driver as a module, the build
> > process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
> > and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
> > build will fail.
> > 
> > Add these missing hints, so the driver can be built as a module.
> > 
> > Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> > Change from v1:
> > 1. Use EXPORT_SYMBOL_NS_GPL to export clock ops
> > ---
> >  drivers/clk/spacemit/ccu-k1.c  | 1 +
> >  drivers/clk/spacemit/ccu_ddn.c | 1 +
> >  drivers/clk/spacemit/ccu_mix.c | 9 +++++++++
> >  drivers/clk/spacemit/ccu_pll.c | 5 +++++
> >  4 files changed, 16 insertions(+)
> > 
> > diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> > index 4761bc1e3b6e..1f42b8045bf3 100644
> > --- a/drivers/clk/spacemit/ccu-k1.c
> > +++ b/drivers/clk/spacemit/ccu-k1.c
> > @@ -1204,6 +1204,7 @@ static struct platform_driver k1_ccu_driver = {
> >  };
> >  module_platform_driver(k1_ccu_driver);
> > 
> > +MODULE_IMPORT_NS("SPACEMIT_CCU");
> the name should be ok as long as no collision and unique, but..
> I personally would prefer "CLK_SPACEMIT" which follow "subsytem + vendor"
> 

I disagree with you, after doing a grep, I found it is more common to
use "vendor + xxx" format.

> >  MODULE_DESCRIPTION("SpacemiT K1 CCU driver");
> >  MODULE_AUTHOR("Haylen Chu <heylenay@4d2.org>");
> >  MODULE_LICENSE("GPL");
> > diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> 
> [snip]...
> 
> > index d92f0dae65a4..893af23c6b25 100644
> > --- a/drivers/clk/spacemit/ccu_pll.c
> > +++ b/drivers/clk/spacemit/ccu_pll.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/clk-provider.h>
> >  #include <linux/math.h>
> >  #include <linux/regmap.h>
> > +#include <linux/module.h>
> > 
> >  #include "ccu_common.h"
> >  #include "ccu_pll.h"
> > @@ -157,3 +158,7 @@ const struct clk_ops spacemit_ccu_pll_ops = {
> >  	.determine_rate = ccu_pll_determine_rate,
> >  	.is_enabled	= ccu_pll_is_enabled,
> >  };
> > +EXPORT_SYMBOL_NS_GPL(spacemit_ccu_pll_ops, "SPACEMIT_CCU");
> > +
> ..
> > +MODULE_DESCRIPTION("SpacemiT CCU PLL/MIX/DDN common driver");
> how about name it more generic? you don't know whether any other clock type
> will be added in the future, so
>   "SpacemiT CCU common clock driver"
> 

This is fine for me.

> > +MODULE_LICENSE("GPL");
> I've got a comment [1] from Ziyao in the review of K3 clock driver
> that suggest to distill the common probe function, which make sense.
> So, I plan to have separated ccu_common.c file, with this change,
> it would be more proper to put MODULE_DESCRIPTION/MODULE_LICENSE
> into that file
> 
> It might takes some time to get there, as I now got a weird panic/hang
> issue with that change..
> 
> Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie/ [1]
> 

I have seen the K3 driver, but I think it is still necessary to add
this line to this file. As this is a fix and it may be ported to the
other version if got merged. So it is better to just add these line
in the  ccu_pll.c and then you can move them in the file you desired.

Regards,
Inochi
