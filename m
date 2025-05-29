Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B3D210FB
	for <spacemit@lists.linux.dev>; Thu, 29 May 2025 14:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748530726; cv=none; b=Mlzv3loaJw2SE+E+Jn9GEIJe2eAcfblForEJxr6bu41P1VBEtNqbzF35uoAmnrIzGxeQxkkY9M6C8wwjWhVe2ECJ4fGpq6wNgpFQbyaZyJUzkkgwvgHMXwEB6k/8ipdap1oTc2rcHDgc65j8C/uaNpdCduZq/oeoeLpKENcJO/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748530726; c=relaxed/simple;
	bh=Gj43M2OdGB7+ObhhmKp+QmuqAFhLuSNYp+6yibi2rPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHbdaFlH2H+St6YKfSjY9igFhSqTFj+xuHmB7ed+M4/17IW9m78O9qVGO3LFKAP5IQKAjXTT9CRVsL7fnJaI9aOfRUWg6dkX2rFZPQj86zLJpikzrY+/0pedKKFC3ik8r7NeZDKZ13DoljrRPaP3cU2Gtlw1/GQTY2p+JvHgkVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0SgKtzA; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0SgKtzA"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso1183418b3a.2
        for <spacemit@lists.linux.dev>; Thu, 29 May 2025 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748530725; x=1749135525; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=62giXWg7WsEB0ulrJR1t2wvmt+DLs2PIJk6M7yXmcBE=;
        b=V0SgKtzA3F11ymudMbYZ2ESwEgVU42LqzKYM8qjJkZHHT5XVQP0m7olGI6XKvS3o6i
         K8JjpM5N4DmWgUHG5J0MdloZGkjFfe1RUhzbMkrZeP1KNSdQN9gRRXpwKzvjpkw4hYqB
         dutIdmWwv7GT+ad0mGidUEynn3xi1WOlLFJMwTn82HaitTxj1nOxhVlTEo+476Da0PJM
         L16amKPJUqK7C5CwxoZztiZHwCX9/bufQWgsJ35y2WkIowbkiVKEBAvupO3KJGEMi280
         M1LCRvYdmdnvNnDNajrTjfgQ/zXOkENC/3OmqEwtyfishZTHV/dHZUpt/tS3iwpK25/N
         SO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748530725; x=1749135525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62giXWg7WsEB0ulrJR1t2wvmt+DLs2PIJk6M7yXmcBE=;
        b=hMN/BOnhnUkDsNB9QgDAGm6oKihmVqocRtMrHmTUbBqS9AjUwhCHJdN1VoFAcAWX+z
         epbZUbr+j+msXhmbdOK9F+Guqlc19ENAu8brTGCUhJxX6vTtyY/Zl/V/nwkwFRcSrX2K
         h6BWfN2AhldmaTfI0/sIbVUV+uS1MXQUD0s8XiCngdN33PwRYG4s10CYKIwiyUNAZE/j
         Gn7jpjD+rbHPMwG9QzK0laRmVfwPhuvjwPEvYcLhEHMbC9qUrnpqasqhJGmeXtzPtuK9
         LWQax7qOLjbJq0iDWL8sJEYMuCHtJNgYbf3l4p9ZpldcnYGc0wOBjC/u8tCaP6Ad2Fho
         37ZA==
X-Gm-Message-State: AOJu0YyzGgmRrA8j20vxbqUP4EIPtebY+TNHeB5VJmlDw+xuXyWHw94f
	Cj9hcbTRBu7AWpYYJBvYy80/FSa4NAoDQcucsBM30GeQ8Z9rycAwN4V0
X-Gm-Gg: ASbGncv1KRkqtz2N9gxvTghVd6NVeY9bIHWhJRVDCc9gdDj0Jll7wQCGe7Ngt1cbTBG
	h+TCq/oqgcbQyhkHigye9vgHmIcJNnBJ0NdTssJezgT11jYhkXx2bWMrun9KEBfX9CK6BIue4gs
	6XaIOwsqask3evz/354og1uyQWdf0MvFcN8yBP69bsWvBEWfG7ZJoIiXgupGsuTud8hCV0rKm89
	il52J4ghaWW8VuRCMMFZX1eo0x8noQ+ey8GEgj0BiWwhieAkb7jjMoAIcAq0Ecik+rD/WewmmE7
	VRs9q8L9tgRu3bX/UkgsZBh+sqdVJDUIgMapixSud9A=
X-Google-Smtp-Source: AGHT+IGYOhDLZwULgZl6IXzdoOY5xQYtIs9vHAaR3rtKYgby02EA6jBpe6c7R8WjaS7P9RLaVvFF+A==
X-Received: by 2002:a05:6a21:7a47:b0:201:b65:81ab with SMTP id adf61e73a8af0-21ad95ab750mr91459637.23.1748530724635;
        Thu, 29 May 2025 07:58:44 -0700 (PDT)
Received: from localhost ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb9d672sm95547a12.60.2025.05.29.07.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:58:44 -0700 (PDT)
Date: Thu, 29 May 2025 22:58:39 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Alex Elder <elder@riscstar.com>, andi.shyti@kernel.org, dlan@gentoo.org,
	troymitchell988@gmail.comg
Cc: spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: k1: check for transfer error
Message-ID: <aDh2HxnGVez6T1Zc@troy-wujie14-pro>
References: <20250529122227.1921611-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529122227.1921611-1-elder@riscstar.com>

On Thu, May 29, 2025 at 07:22:26AM -0500, Alex Elder wrote:
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
> ---
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
Sorry this is my mistake.
Thanks for your fixes.

Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
>  	else if (ret < 0)
>  		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
>  	else
> 
> base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
> -- 
> 2.45.2
> 
