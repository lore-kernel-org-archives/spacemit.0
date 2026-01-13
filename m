Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0EF201004
	for <spacemit@lists.linux.dev>; Tue, 13 Jan 2026 02:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768271817; cv=none; b=Es8CvWr5A3SnchEP3+I4D5h/W1/qYJY0H3OasneJbW1gUJr66GSi9wd9UZXWcdayGNyu7jim7+1nKnETdWqB+owz4Z5aL4qbRoU3wCdgCeJdfPVM/aOyUneahVOaEBLUYLn1fWKfSTAdWCR3oDySJ0Ig2YvQ0MjPMEBuOjdUhv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768271817; c=relaxed/simple;
	bh=T0BFKWA3HQH24lFarMN7bmz5yflktfvonYuGjF9O068=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWuhZnKQvhD5RZzZcALEjRF4VFC8RFIFwsHptqrz6O6a0G2TtzHmhqSY1yjBYzxQtH4u4XXw568bL7QeNmaQ9jborGBG1hn8OA7t21ubH01wLJkPetNPNptrJs5fuC6BW7J5sn5FKvpZBEIw9OeDa2dQHhosodh/c974MCqQYrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfIvWo5v; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfIvWo5v"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-121bf277922so8256920c88.0
        for <spacemit@lists.linux.dev>; Mon, 12 Jan 2026 18:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768271815; x=1768876615; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ySOV1qaMnTkxAOEjKtqV21Yq3qmzkn5kZVxToJlMeM=;
        b=WfIvWo5vASbT5T9vrO7IOQZeo9UWPHxBgOBGlcQ2WpEmF1gPa6iS65nNsFsfj47/CH
         Fqmgrhe76nVXzfGmNK0HxwvpX+iaAzH6X0Ku+v7KZD1UA92anoikm1Sduu3mOe6U/+3V
         iY/ix1cyO3hPsozpZYRhOFmD7DJp/g8eOVkO0LqRNv5rmdDioIGyDzvXBbiEuK573ZU2
         mVajaYyghpgSq9QuoMWHTqO+TIH2MGOCNe6itklmeoajFS1Wt4Svdu1vSrdbT19ERf5v
         oI2lYeIgRMeyxTJsF5VdgKEYtY+dt8BeWXcB3Z3L+iRufEBoDUDvQf38oGfbA2Isl+qZ
         7Mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768271815; x=1768876615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ySOV1qaMnTkxAOEjKtqV21Yq3qmzkn5kZVxToJlMeM=;
        b=jyh31VKnFNFqdLGmsPP5QGmlFqn1wbsIaHNqy5+bpt3KoWD/VAhyLq6oEShK5GHp09
         qGp8+S3S2oEFx55o4BnF+jNEHQ1ytKRE3YOb3A+NZt+BebE0oClm75lgn0UHWB8DEqWG
         +UCDC11JhOd3tf94H8nUmj/CTyNc9FM5RZ2B+vItQoU5KqhaFon1CYY/lMj/5YwlUD/N
         v2CUuULG/+W7zWYYGTt37sUfBrRgg4pgdN26e3QQ7XO40+o6CY0MWpi1dy2cIwFqeOE0
         tGeZwYBQJQjikBHGkzIpnQfFjioqLCnWIH9gBHt9XWtd303O6osEFciIP79A8w/uZGMF
         ptwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzshfxEfSMLG5cdIx59QpWcLZIpDmkdoK4bUELkkFP1nlSJcRc2AoVckMDAP98NwhpiUsuooC44Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCVt7KvakMgj0AENGww9kNBMA7ByyGLV6KodPrx1dUPtyIr5yJ
	AWn10dGjHDWwZNREmbhd+TWOxok72p6qEhYwL2epwE6p56BHUux4ZdyN
X-Gm-Gg: AY/fxX7P4dajJTmRdLmZnzN+j6I7QeJaSqFIeFVC5PexIMN1obBNJXr4edSKiZGF77X
	EBBYZ6SN9YVOXqj5pyJZZB6R+kVi6DNg2cuZFMn6+3hSifI7nKizAGvfKin+MoCQu9i4P+c7d6f
	1TUV90qt2LRL7MQ8t7Dp7yqSq8+X8lInlsdimDTh5ve7TH3UHMMAyPKXtilprEWd3LZDPxTaFN9
	iqPvNFcyywE0uKMYYzwCD4qifjrBL3EMgSpLs5+k4nuMZEJK3xA4jUEfoTUTfx3X6yqvuFA2Gym
	AvE+SVqFJ1D/BK4ggLErCQ0sYBarOIp0oBC7QbFXBxS5OETInUWGzGAvcQ17ghtMUW/Ajtvotvk
	B7ufMuZwwbo4mWKf25tn4S4kbRdkWeEVI78dDWvAjRkNQkiQE170Z5uuUsM5AdzrDpVWI3pNbau
	ysMitYwGgzoA==
X-Google-Smtp-Source: AGHT+IGpFCitrEaTw4etF3DikT7lkfaNYnJTI14jlBptzrIbvJlxQxJoE7rmbUdEP06y3VG97kDZXw==
X-Received: by 2002:a05:7022:6096:b0:122:415:25ed with SMTP id a92af1059eb24-1220415265amr14083544c88.49.1768271815354;
        Mon, 12 Jan 2026 18:36:55 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c16fsm26823274c88.10.2026.01.12.18.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 18:36:54 -0800 (PST)
Date: Tue, 13 Jan 2026 10:36:34 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: sbi: vendorid_list: Add SpacemiT Technology to
 the vendor list
Message-ID: <aWWvhPHH0_VUbeUY@inochi.infowork>
References: <20260113-spacemit-vendor-id-v1-1-f9650fb8acbc@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-spacemit-vendor-id-v1-1-f9650fb8acbc@linux.spacemit.com>

On Tue, Jan 13, 2026 at 10:32:21AM +0800, Troy Mitchell wrote:
> Add SpacemiT Technology to the RISC-V vendor list.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/include/asm/vendorid_list.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
> index 7f5030ee1fcf830b17c6529e9c430fe19ac68b05..5f75408ddee75d1e45c2c72207c66c5905f9b84d 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -9,6 +9,7 @@
>  #define MICROCHIP_VENDOR_ID	0x029
>  #define MIPS_VENDOR_ID		0x127
>  #define SIFIVE_VENDOR_ID	0x489
> +#define SPACEMIT_VENDOR_ID	0x710
>  #define THEAD_VENDOR_ID		0x5b7
>  
>  #endif
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260113-spacemit-vendor-id-841edcdfbf48
> 
> Best regards,
> -- 
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> 

I see no usage, this patch is useless.
Please submit this code with the patch that uses
this ID. Thanks

Regards,
Inochi
