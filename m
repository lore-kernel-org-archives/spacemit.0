Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5610642980D
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 22:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276834; cv=none; b=ehP1yKp862LkGWQ472Hebmmq2qcoVhLjVh1Z+M6aO4c0eDEC0r5UMw0dpixhXP4movB8/wsp9iA2wZhkE0vxz5HwjADSsAwxEe1Uv5crYPBudgLj/OjWLZkOtViOZMqrvtB/5tPP0ht3+VD1sj3xaW/56LQ1UW7wZSWTGR3V4pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276834; c=relaxed/simple;
	bh=wEmt415FHzq++0CCG1f576MPPFXRLPNUXlNkDmLPZ8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHr07VHidAqwEEp1Fy6//VP94CxSZJDOEOYy7XXFFdudq32urcrXxiOptM/zc74/aIzahRFlq5P2A6jp7eqmu6O0GFuSb08F4e/4qE9JAb51ykfUjuklH0d2nWB9VtRPe/NZDBtqxUWXwouAo1iSrPwQCX96wu8szHXmOd6XkxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNCmzZsX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNCmzZsX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so4974875ad.1
        for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 15:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276833; x=1785881633; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCl15eSRo62XRO+xaCq2uVtZDF7Ezk7Z7ce7c0TVl9Q=;
        b=WNCmzZsXImzswQVyLtNSP6/m1D0V1io3JI5gbsXx9C8/6smvoNoQMGu6Z4bPioqqxs
         4NlQZOPUyI62hYn2IAWDOdVMyNH6a8VSalcjHpQ3t6hvfK5BCSEuYNsmhsKVlNLNfZa6
         xImGqJ1SGcrWt2xp/z7u+czcO/EZ/L2oF6rJP0+aHQkv5llwF1mqjUVd/WvFC+f9CBDM
         JSgNjEGJW+Hv91AcpN11MWZknrp4/f3QI2Oc96fuVHsu343SBHWKlNihfFByHQM7Cluj
         wJJlJBJHCfU8jmSh3REOQdNJ+jjMZ2pA/2Nc7j8cQr8zIb+Pl+8WWkMgHh/vVR/Tn48G
         9/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276833; x=1785881633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCl15eSRo62XRO+xaCq2uVtZDF7Ezk7Z7ce7c0TVl9Q=;
        b=S5osaxSL5VYg4bcbpmGoJfqRTWA9SPRkEEi8aZuC3tdKz8WIsU3VCRHmItfKaHY3xf
         ggiBFBh7SbdIvcWUQbuOMonbSjP0/h+lwzrYpk21sDsry+2sFJqTA9bnwjzuAAeALOwJ
         klzMu6w7vw6QXZdqVcNHn7MaH8upqXP6eXV7PIXLtxVLzng0BCV6RxCoSag06k7g16ST
         Y4vLCrQT0juhA5twRShI6e0EtPfLClU2ucy/zIjX6d/SXwnxB7EtEJkQSMlGP4dS/wce
         4a3Vp+rrvfE+3CnzPrNiqlLu5Gtl8yAoZmvQw8OxAT7KKWAjuoeZjpVhG0zx0TM1zPVc
         vG/A==
X-Forwarded-Encrypted: i=1; AHgh+Rq9KzcwgvdkbIuKcXTE104IcUzD5f46dsDPM/pH4fNYN2QeKGeJg1QguBfANTsx/C/Ui6rS9cjmHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQsdVJP9GNLWW33F10xfyhvMHBu4s8wd8cFQssop77j0kVkV5H
	CghyW34f8MRoQjd8VS6Ss4oynylXqQus4KAQGtz7UqzcY6Ix0ft5DsSl
X-Gm-Gg: AR+sD10nOXXMEzyYE2j8DZNmj4l+XPLXvHdN9jBG/12fTPKzZlG8gmxAiIxoEnl6cl2
	uCOf/PdJEJifkGpeMZHSGHSxKyFIkyAOmniUyxG9EeX1JhQqA+f3quGdaG2oJAR9x/nSC7gHJgA
	ZZoDrhBdWexav0C58JYPnNlGj3W3lmmwLiUpxgeS0ej4iX97oLKvERfaQlwvSdjoYjMQc+NTftz
	29tKLvfgR6xYVNKnlRo47RgB6Uf2zSxwSI0nFfCnfBnahpp4mOft8PGl9rUx8bjZLoYN0c0WN/T
	lxxLKP2WSBWTMACrN1Pl4Lu/gcnxNj8xW3a7o1ivOUyMY1icKZpOtG9UndBhPKy/0RXqZcMs4o2
	LRCbp1hIp5tUzkmzDnTzTqFtP4zA3qE1XVxFQ3goSmQ1Fse1FhnLIxnqC98tPff/BwsnhcKDKv+
	7nDj3pzjg3MMxFZhO7W+bxLhp3eGwSrqJ67Lc+fMXaRxAIZ5CDvWhDytTVfrA=
X-Received: by 2002:a17:902:d2c8:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2d015c8fbd9mr45936265ad.6.1785276832549;
        Tue, 28 Jul 2026 15:13:52 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf39b5sm2108355ad.57.2026.07.28.15.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:13:52 -0700 (PDT)
Date: Wed, 29 Jul 2026 06:13:41 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RFC 1/7] dt-bindings: timer: thead,c900-aclint-mtimer:
 Add SpacemiT K3
Message-ID: <amkpPAu3sqycI3CZ@inochi.infowork>
References: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
 <20260729-k3-aclint-v1-1-aef88614d3a5@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-k3-aclint-v1-1-aef88614d3a5@pigmoral.tech>

On Wed, Jul 29, 2026 at 12:36:27AM +0800, Junhui Liu wrote:
> Add support for the ACLINT MTIMER found in the SpacemiT K3 SoC. The
> hardware provides a ACLINT TIMER unit. Adding riscv,aclint-mtimer as a
> fallback compatible allows direct reuse of existing OpenSBI driver.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> index cf7c82e980f6..c9429a2fa364 100644
> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> @@ -21,6 +21,10 @@ properties:
>            - enum:
>                - anlogic,dr1v90-aclint-mtimer
>            - const: nuclei,ux900-aclint-mtimer
> +      - items:
> +          - enum:
> +              - spacemit,k3-aclint-mtimer
> +          - const: riscv,aclint-mtimer
>  

Drop the generic riscv compatible as Linux only accepts ratified spec.
But this ACLINT is already archived and will not be ratified.

The request also applies to patch 2, 3.

>    reg:
>      items:
> 
> -- 
> 2.55.0
> 

Regards,
Inochi
