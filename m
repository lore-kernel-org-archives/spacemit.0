Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FC01A01B9
	for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 02:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749780736; cv=none; b=TQNQYvU0CK+T8oQGZxXtT+LpWZXe5GOBVeC1OitoZ5JpNDJuIiCl2MfPiO4vdcxQ+6rBLr0pCcaFUf72RSD+/1D6qzUofX2mWQeZsCRGbT1Ml8SWeLU2bvNsoH6zYkoMPenowPIPaSY+IH+bB8Qc4QerQlUHrxKG/X27HuoBiFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749780736; c=relaxed/simple;
	bh=oV2F7jyiXlkuJRhDsFyY1YWgqEbzKbiBKXchw7JTdGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dibsj/EVYGKllBYkxwlE7WtPPJxrrb9I6Tcxs06u8Mn7UehkQjzfc/IyKz/uR3/38DhsZdQQ8hUO8R95hLpb5L7Bx2VUq3xqm5G9zRmLt3vIk6M23bbteO/FWgbWZ/qGV44oh+WlNKHOJX9czRv4+TGYSwk/VRESU1QpFfWZwuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyQviZZ3; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyQviZZ3"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-236192f8770so11452215ad.0
        for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 19:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749780735; x=1750385535; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/hna0O+LUaLx+0oktXX+K8llS+HEe3f1PFlR9cMiAfc=;
        b=lyQviZZ3IqFw4v36LQqVPiDV3rZpWzQw7Rxewdz09OCddT4CcYbCsUeiD1VWIMcr+n
         /8cAQGMBHISeiGSndBX/d/CHDB0nhxDLpZbtFAWEscwKMc+HdB0nShrq7nGODHIbwNhc
         P+iRTeycZzu+iobfvkXEYi91wquistg1ltxBYtwqQ7s/a4wV8D+WLospTqucgZoF9Qvn
         wsrrVTM2eHgRcE+5tKwOnoNZ4bdpuKtA2xwXf+8kaJ1hodbLNICKdKHPNTmFxY9BsNXT
         VgUEzWao9zvb7F30Xxx6K0vbO3QWgIr4a8IOq9kSQhvTe2p/Bvxc+p+mveg/5HGb0aZ5
         Fk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749780735; x=1750385535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hna0O+LUaLx+0oktXX+K8llS+HEe3f1PFlR9cMiAfc=;
        b=XHx67RyRpcNlRZxPlr/D/PEwxwAlUcZvzpA+p3NuOhjg+H3HRnJX5WGmUSqcHzPXZa
         BX6lGxEEi74nj/0JRWzlSp5TU7XWDWfX/x85c/Nugi31g966PnYM8sIpukq4d12j5pBz
         RI/f6FGidfkBobfjOv9/sZffkvaapI04EhhUQ/0CuaPgKYZN0RGppjkyiHXr9T5FDlUW
         pkKbNERWts4/G8I7V3DDd/0BJlSRZA9f0RiAABc4PmMO6eli38Tmc6Xia3oiMO4nDXw3
         8uu80EGBnxXXCkvp06OtkOy7wiFPXFN18CZqwcsIB+Wd4L8P8rA05S1TGKag6BrOF/u9
         TuaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe7zROYvY8PBmmRuzstWu72C5oTFjJCPzUCkdROP9lUShP3zUoL6YKHVNTZDn1QqkzAxpw6dciFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxAag9V8aXIJsbTKYWl3eFreMYU5dzW92tnPKyqU5pcHuTY4R+
	PfKX20ftaclfWdpRHyKAA7z6idQTz+NDEjD/SM/aeDZ3NLgiVOj+SiZv
X-Gm-Gg: ASbGncs2vbN86vn/uQb5ibfElQwgG2P2rxGZPVXIkqQIQ8os3SiWrHO889uB+aMZ0qy
	BwfRIsU2n+KUb6JMZDaEvXhpmenjGFdJpPp/A7JsNNlMR2q49YbCbSIoQaOyj+ugQCcW62aggI/
	mKQWhsNTPtuJ7htcPetJheLsSum9KohivnasnEzgPjjcHQnxE7nWzx+XtFhahzOpOsKpxqP1rRB
	k0vp+dv9cByT/ciVTHrT3IPX5tlG0p9T0e/rydhScW4GetkiehdYGQMSqzBYu9LGF9a1lZeaDol
	AoBXhJJ0dnbSvBXHvnQgGLNrJBpEVAO0O/z8DktH5SaRglP11iJRWQ==
X-Google-Smtp-Source: AGHT+IEn+f3gutrZsuGdkCNgFErV5PdSC6Hef2d/nsG5l9WFwb349LMISTX9gwCyLloUOhY8JzqgdQ==
X-Received: by 2002:a17:902:ecc1:b0:21f:5063:d3ca with SMTP id d9443c01a7336-2365fb3dde4mr12310335ad.16.1749780734677;
        Thu, 12 Jun 2025 19:12:14 -0700 (PDT)
Received: from localhost ([2602:f919:106::1b8])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe1639e5bsm403153a12.2.2025.06.12.19.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 19:12:14 -0700 (PDT)
Date: Fri, 13 Jun 2025 10:12:07 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Alex Elder <elder@riscstar.com>, andi.shyti@kernel.org, dlan@gentoo.org,
	troymitchell988@gmail.com
Cc: linux-i2c@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH] i2c: k1: check for transfer error
Message-ID: <aEuI9-QWCv6CRUyX@troy-wujie14pro-arch>
References: <20250612225627.1106735-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612225627.1106735-1-elder@riscstar.com>

On Thu, Jun 12, 2025 at 05:56:25PM -0500, Alex Elder wrote:
> If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
> complete, or if the hardware reports an error, it returns a negative
> error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).
> 
> The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
> which is the i2c_algorithm->xfer callback function.  It currently
> does not save the value returned by spacemit_i2c_xfer_msg().
> 
> The result is that transfer errors go unreported, and a caller
> has no indication anything is wrong.
> 
> When this code was out for review, the return value *was* checked
> in early versions.  But for some reason, that assignment got dropped
> between versions 5 and 6 of the series, perhaps related to reworking
> the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().
> 
> Simply assigning the value returned to "ret" fixes the problem.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
> ---
> v2: Added Troy's Reviewed-by
Hi Alex, you added the changelog, but the subject line 
doesn't have the "V2" suffix. Is this a mistake?

            - Troy

> 
>  drivers/i2c/busses/i2c-k1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 5965b4cf6220e..b68a21fff0b56 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
>  
>  	ret = spacemit_i2c_wait_bus_idle(i2c);
>  	if (!ret)
> -		spacemit_i2c_xfer_msg(i2c);
> +		ret = spacemit_i2c_xfer_msg(i2c);
>  	else if (ret < 0)
>  		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
>  	else
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> -- 
> 2.45.2
> 
