Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A9D248F7C
	for <spacemit@lists.linux.dev>; Mon, 10 Nov 2025 16:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762790739; cv=none; b=tiq4nJkvTHXvDDFlHG6bx9ptJHl89tcLHxhRXBzZmSJ4FEmVYeRjiORhGUJ1heuafo0LlYcDnnW4atlW2bPhQ4LCGjs+N8U5C9LgpDrFx7c5A40FZZV4hyvvJdFgNOFGfSz4lJ2aZtsH5ePVjGyTj3TmzvAy9pGNdFSuKwKePiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762790739; c=relaxed/simple;
	bh=onmwgzWvrykN1fzVZiejcYemdHDzwD/isE77f44YfsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZpP/duRWydAHLnkeZTaHQeRYevqs568rLhIutFbJ+MYvQxVjLq60zM60GO+CVUHOu8BuCBiSuwlpS+jfl8ybwtAtu8LUPLrB2gzTuCnz5Gj7hS33y+/UuWiEYr8TUmSRUshPL2elshNoFtS4x1rkPtLgKHPIXy3IpF0FmpEvK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chxHZaVX; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chxHZaVX"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7afc154e411so1861852b3a.1
        for <spacemit@lists.linux.dev>; Mon, 10 Nov 2025 08:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762790737; x=1763395537; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TgZgArONH6lr9XvODSMICWYyuVWCZCYNoJZs+MKJ66o=;
        b=chxHZaVXpptWm+fXqRrFXyTt0B1KuIK2HL/rCasbGP6G78048OXqsltnKDg4AYRcca
         ijps6GHz38JECNfXgqhR7FyYkvG/MzgARm/XIt7lPrtn6379vcTFIT9UY8dsVR73rseV
         ynmJ8tNTetoE8j6Gjo+fStRCw9hrVKnjMDWGMyqpwSbu1UxY0dWuDA4sNKngarpSdAph
         cdna5hNyGuR+tfjmy4X3kjHCxHrbVchLguhMOIj9jc0FpbdYZvE3O3IhMsaTc7uCEq9O
         oyOJbK8d6SJHNkInwhocujdsnDQ4mKdcX+tUsNYwiGXUUNzUEdtuUrSsolFz3Ks8WyL1
         XYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762790737; x=1763395537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TgZgArONH6lr9XvODSMICWYyuVWCZCYNoJZs+MKJ66o=;
        b=GUdO2/hKqTN5iJYWiViePo0CyOzvwPsZTBhiK/9bVBss/Flq8ulgF80R4WkkkQrWuF
         NCyDIR5/+L9CWpSXMvXkBc2kVIMRfHDQ/zpTjgqQVBFrnDXAhs02J36J3EYoHZI2ryRe
         hbum3juP8bc4F0RHG+mzExPqdF4HJPJI2+TbtG8fzOi/t1R7EJerEpChsQYvobZa/vZO
         TlCo8HdgTBm2DSFIscIIqIMzWmbIMR7VrTpbOYDx8EI8X/wlqcqYHn0M/ZcQV+MeZR4U
         2BupS5+joskzy7oKxs6t7ZNsJ1K5JQd3F3ygP8omet36rkxw8SaJTuO2iBHYXtfV5y/4
         fKAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFpqk/5DWDq1pOQFn4BZ07NU9AkTWv8tkFdwdghLdc4lo/7VIONVTxf+rePbYoKEO/nl7sU6BthQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKtHh6o2dmyOPC7Qh8LkjnI2ubT7oVfGjj/dPapMdoYVlG5ZuB
	PzScmGmyGwuoQtnvj5srMqe08fVQCxXUpP3xhA2sT1GhIjtnFU4E4nIH
X-Gm-Gg: ASbGnctfuspOInTHwzi+4VsWBTPzQNwMKjTUnqq7qWX3JdDFlZ2CzlQ5vD11J2BFKv8
	1GSuXg7WnjJbizPN8MYz9XmfClr5j1kENjC36ohXzYXLWLDY1Jo3SZIhhM1gQ6qXvQx4NpEL5BN
	uw7cEOMMVGy5b2k5ckg7iRDgigzXPauYMRfaEgwZSKR04YBk0QRPchXpxmnVBsyFGyu4bFC4U34
	mfCzohA/+RuOUf1Sa7Y06tHZJIFHAAYMJ1MIi91hbLEaMi28LWVAI+mqORuYCHNleyJY/HlXuof
	69ZpX31SY1+s7n+rFYjcYOGG0YtnZT5l9a1JNpDmJKJJyHo43c4zk0GCTRik80m32gQPQIGA+jc
	b9L6BOYuCORHMdJISd/wlK66OEVg39LI5qs6eJlcKMGLlo8+HJdxU4zBRxGLpfDTyPsgUfklpFH
	epI2Ef4SA=
X-Google-Smtp-Source: AGHT+IF6WNNBzThjDgikYB/HqeiGseOlAPwbhWtHTRN1quM7bZZi7LqL9mv+idqwSvzAApOMFvrtbQ==
X-Received: by 2002:a05:6a20:1584:b0:344:bf35:2bfa with SMTP id adf61e73a8af0-353a31550dfmr9952656637.33.1762790736506;
        Mon, 10 Nov 2025 08:05:36 -0800 (PST)
Received: from localhost ([2408:841b:d00:77aa:3e0a:b50e:a68d:6665])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba902207227sm13072965a12.33.2025.11.10.08.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:05:36 -0800 (PST)
Date: Tue, 11 Nov 2025 00:05:29 +0800
From: Encrow Thorne <jyc0019@gmail.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: spacemit: fix comment typo
Message-ID: <20251110160529.GA18666@hailin-HP-Pavilion-Laptop-14-dv0xxx>
References: <20251029-b4-fix-ccu-mix-typo-v1-1-caddb3580e64@gmail.com>
 <20251029223337-GYA1549833@gentoo.org>
 <20251110141251-GYD1651402@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251110141251-GYD1651402@gentoo.org>

On Mon, Nov 10, 2025 at 10:12:51PM +0800, Yixun Lan wrote:
> Hi Encrow,
> 
> On 06:33 Thu 30 Oct     , Yixun Lan wrote:
> > Hi Encrow,
> > 
> > On 00:05 Wed 29 Oct     , Encrow Thorne wrote:
> > > ccumix.h was copied from ccudiv.h and the comment after #endif was not
> > > updated.
> > > 
> > > This patch fixes the incorrect comment to match the filename.
> > 
> > Just describe in imperative mode, see
> > (since this is trivial, I could amend it before apply the patch,
> > so no need to resend)
> > https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94
> > 
> I have no other clock patch queued this cycle, so how about you respin a v2
> then let's ping Stephen directly for inclusion?
> 
> for commit message, I'd suggest simply as below (short/clean, also enough):
> 
> Fix incorrect comment to match the filename.
> 
 Thanks for your feedback.
 I’ll send out v2 soon.

 		- Encrow
> > > 
> > > Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> > > ---
> > >  drivers/clk/spacemit/ccu_mix.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> > > index 54d40cd39b27..c406508e3504 100644
> > > --- a/drivers/clk/spacemit/ccu_mix.h
> > > +++ b/drivers/clk/spacemit/ccu_mix.h
> > > @@ -220,4 +220,4 @@ extern const struct clk_ops spacemit_ccu_div_gate_ops;
> > >  extern const struct clk_ops spacemit_ccu_mux_gate_ops;
> > >  extern const struct clk_ops spacemit_ccu_mux_div_ops;
> > >  extern const struct clk_ops spacemit_ccu_mux_div_gate_ops;
> > > -#endif /* _CCU_DIV_H_ */
> > > +#endif /* _CCU_MIX_H_ */
> > > 
> > > ---
> > > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > > change-id: 20251028-b4-fix-ccu-mix-typo-038c19fe30c4
> > > 
> > > Best regards,
> > > -- 
> > > Encrow Thorne <jyc0019@gmail.com>
> > > 
> > 
> > -- 
> > Yixun Lan (dlan)
> > 
> 
> -- 
> Yixun Lan (dlan)
