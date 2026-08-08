Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC32818DB1F
	for <spacemit@lists.linux.dev>; Sat,  8 Aug 2026 05:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786165456; cv=none; b=JSr74TSx47f6BZ45/TlCs/ObQCf1Np0OluR7+WyWuXnOQPtYeejnHun/uye+MVhBDdfRpb9Gk4HkM3l2mgOccRs4yvoo/r1HoyGvz4Z8gl7rQ156FsDkRJ6mXD22QhIg/u9me+iPcPqy7mxXrlFuWstK2UjpYBfsQ3xDrJbX024=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786165456; c=relaxed/simple;
	bh=9ucFn8yjujP0VoUhtpH8rGna1HadIHc3Y9n01MXVHxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S82Tk8y7DDxqsPZIAXeSA2wAyL3K/wF55/FuOJqLAznwTYgIfCJCaEnoGPHob0V+T0iXT35TWdT1woaHe7CKlO/jQfvTPNyhmJFV6AzuHFL+BFKe4g0d+a5nFh0owGw6S/sM3ByvmQsYiutwqbebMyFpywMMqNi063bo7GidFDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4Xog3Aa; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4Xog3Aa"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc891373e0so2621075ad.2
        for <spacemit@lists.linux.dev>; Fri, 07 Aug 2026 22:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786165453; x=1786770253; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8uD24huWZm6XpJh9wT7WOr3BJsSLtwFgAarL6fJ9kQ4=;
        b=P4Xog3Aa0FIvj24levRpNu2EUh4Q+XPwSCk6/rGfS3oqKbBe+otPG/96dxfsm4Irah
         QuLoOo6XL3OV/uCJ6EC6eKB4Un37rwIWlImlaSv0rsciNXE02ZVFitQcxZkNk5icIPUD
         BPijYXMeDmL3EjHlYRufeAYf35FvZaaNWfxFFTny2ZzP4giTzM9FYFZFOCZ3R+MOtfCI
         pXqf6LlwnDbKVRfwPGJpgtD52Bmyc6Hz5+/Qtcu2ganW2wP90H1EsTq6rcOmTPxv8nV0
         SmYZNe9gylRszTBTfg9+aly/jX93ojg4jn/DG0aobi7hcEXS8qeXCHVzppiNNSA+x8/i
         +BPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786165453; x=1786770253;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uD24huWZm6XpJh9wT7WOr3BJsSLtwFgAarL6fJ9kQ4=;
        b=l1qmIxVN2cDHesWOaby3HyJlUt4RrTHin30fFdK8N+3RLmn8wyAmMHdkP2Iu4eIy7f
         f37nPZ7nXb1IvH/dYWzIr0n2IkfVl8hoCzpf0f20C6LhJlo/qSODXJ7mhLOiOrV9EsU7
         CZpmqid7O4saKWYEB9TDl7KY3R7SSGjr9ZhSwViY44kkpMrNMcQcc/WKNL2PGSN8613Q
         otxZbYsBKENHXUICdfEU/k0p8wBQvQP468+2+Rjok+AKMvFidvdd8p4IfY7jy4fbpCjC
         RwY+gmu/VwnYIhzcr1Bg/rKWb7QuAVCNz9mFw2mk3Tcrgc/VuyCb37eL2z81GIwboiRh
         d1fQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAc0xRg2xlXOUCUh/Zw+Npfx1ER2r2qfTqnXeT9fYPNXYpzRjKem2C2sBra15l2MFv/h66xh6wZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxYmbO7nDNYT0s7mRufUoIbZgBshKeSNBoJDmZW3BlGvKz6whc
	Ez/uZ885NcEDNUGCjzy9lfeS8ehL8FByfZOYC4QTA5Le/H2m/hCIax4h
X-Gm-Gg: AR+sD13aYEqO4ve6sVL+T1qfXbXHdR3lKgbZGb3LvCC2ggO0zKWFaC+7A1hDFoO+5HS
	aerR7spzfZJwdF6I33KkCF93KrmyiTf4MdqK+DEnvvhTFKLLc1nP207eHLuBXyym0J5uAKFV3Sm
	EewoeiDK4pI1+ZwIyW6EQBdO+Gn7PY8mfoGHKaSWWr7gqgJc/Lq3IIM+GkiltL8mzSl6VILoYAC
	ChcJAU2F+9I1BSASWowtmSn4DOs/4ZMqxaL2clRbD9M1Kc/qjlzCWXQy7dKOFtptGP36IxsrnxG
	vShESQPdP+p18Us4ze8XHAr89YckK2HVbgdQkhTLpjGtSxw+OCuu1lVHABvVLEz5263cTLeSLw2
	gJKFO74I3vWa2NRVh8xO7FWHEIcLE6aAGCS45hv/WglySw7Pg/Ps4AIsgXC7Xb8tPfk0rMFE7Ms
	TzOC2v0dxJ+RuDwmCcu5JKDzfo3Xg/01+7VQ==
X-Received: by 2002:a17:903:fa5:b0:2c9:d8c6:1dc3 with SMTP id d9443c01a7336-2d0ca1611famr339026475ad.0.1786165453023;
        Fri, 07 Aug 2026 22:04:13 -0700 (PDT)
Received: from localhost ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14cce7830sm15452855ad.29.2026.08.07.22.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 22:04:12 -0700 (PDT)
Date: Sat, 8 Aug 2026 01:03:52 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: codykang.hk@gmail.com, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 10/17] drm/spacemit: add Saturn DPU KMS pipeline
Message-ID: <wr3264hzlya6zep433nr3u2acukizilkrqpkj444kfqeyaeorj@2rc4zo2cqcer>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-10-6de34d80e86c@gmail.com>
 <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>

On 2026-07-27 09:35, Philipp Zabel wrote:
>On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
>> From: Cody Kang <codykang.hk@gmail.com>
>>
>> Add the atomic KMS implementation on top of the hardware backend: one
>> CRTC and one primary plane per DPU instance. atomic_check validates
>> the plane rectangle 1:1 against the mode and sizes the per-channel FBC
>> line buffer; atomic commit builds the cmdlist batches, maps the
>> framebuffer through the DMMU and arms the cfg-ready handshake, with
>> vblank events driven from the DPU interrupt.
>>
>> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
>> ---
>>  drivers/gpu/drm/spacemit/spacemit_crtc.c   | 815 +++++++++++++++++++++++++++++
>>  drivers/gpu/drm/spacemit/spacemit_planes.c | 376 +++++++++++++
>>  2 files changed, 1191 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/spacemit/spacemit_crtc.c b/drivers/gpu/drm/spacemit/spacemit_crtc.c
>> new file mode 100644
>> index 000000000000..b75ff6320501
>> --- /dev/null
>> +++ b/drivers/gpu/drm/spacemit/spacemit_crtc.c
>> @@ -0,0 +1,815 @@
>[...]
>> +/*
>> + * The assert and deassert orders are not mirror images: the hardware wants
>> + * these.
>> + */
>> +static void dpu_reset_assert(struct device *dev, const char *name,
>> +			     struct reset_control *rstc)
>> +{
>> +	int ret = reset_control_assert(rstc);
>> +
>> +	if (ret)
>> +		dev_warn(dev, "failed to assert %s reset: %d\n", name, ret);
>> +}
>> +
>> +static void dpu_reset_deassert(struct device *dev, const char *name,
>> +			       struct reset_control *rstc)
>> +{
>> +	int ret = reset_control_deassert(rstc);
>> +
>> +	if (ret)
>> +		dev_warn(dev, "failed to deassert %s reset: %d\n", name, ret);
>> +}
>> +
>> +static int dpu_pm_suspend(struct device *dev)
>> +{
>> +	struct spacemit_drm_private *priv = dev_get_drvdata(dev);
>> +	struct spacemit_crtc *a_crtc = priv->a_crtc;
>> +
>> +	/*
>> +	 * Assert before gating: a reset asserted into an already-gated block
>> +	 * has no clock edges to propagate on and leaves the register file
>> +	 * untouched.
>> +	 */
>> +	dpu_reset_assert(dev, "lcd", a_crtc->lcd_reset);
>> +	dpu_reset_assert(dev, "esc", a_crtc->esc_reset);
>> +	dpu_reset_assert(dev, "mclk", a_crtc->mclk_reset);
>
>It looks like these three are mirrored, and could be handled by
>reset_control_bulk_assert/deassert().
>
>> +	dpu_reset_assert(dev, "aclk", a_crtc->aclk_reset);
>> +	dpu_reset_assert(dev, "dsc", a_crtc->dsc_reset);

Is there a reason these two cannot be mirrored in order? Please double
check. As I checked the vendor tree, the suspend/resume side appear to be
copy/paste rather than a deliberate ordering.

Please double-check. Unless I'm missing something, I suggest to bulk them.

Thanks,
Guodong

>> +	usleep_range(10000, 20000);
>> +
>> +	if (a_crtc->core && a_crtc->core->disable_clk)
>> +		a_crtc->core->disable_clk(a_crtc);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dpu_pm_resume(struct device *dev)
>> +{
>> +	struct spacemit_drm_private *priv = dev_get_drvdata(dev);
>> +	struct spacemit_crtc *a_crtc = priv->a_crtc;
>> +
>> +	dpu_reset_deassert(dev, "mclk", a_crtc->mclk_reset);
>> +	dpu_reset_deassert(dev, "esc", a_crtc->esc_reset);
>> +	dpu_reset_deassert(dev, "lcd", a_crtc->lcd_reset);
>> +	dpu_reset_deassert(dev, "aclk", a_crtc->aclk_reset);
>> +	dpu_reset_deassert(dev, "dsc", a_crtc->dsc_reset);
>> +
>> +	if (a_crtc->core && a_crtc->core->enable_clk)
>> +		a_crtc->core->enable_clk(a_crtc);
>> +
>> +	return 0;
>> +}
>
>regards
>Philipp
