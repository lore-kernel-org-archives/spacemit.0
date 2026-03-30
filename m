Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F157B37F8D9
	for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774872971; cv=pass; b=uLxi8WOonFbq6XQaHk3NuDmnBubVhFdoJCUyEk1iXoYLgCtyZ7sJ6SPXLrDLiHdXasYOteSRGFBsZ3rHXkxgVV3v0va/b8M8F++kGFq4p8h8UM4VmHpcPSBDKLkIjHR+snHr6fMDQHph7qPRPy4cht7nkfuohk8DFkpd4q0UIh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774872971; c=relaxed/simple;
	bh=Uw35mKRYCMJg9FLMVpCEhFv3Apj6vxn4xy9VKcxb9Ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGZzymLS1IEh7geo0lUXUbGxDsEN/WRxvA3m7mqua1WtzVzOUEHu+ezvN+Y5IwdLRThpm8nxBs7xKcAGVKnyC0DJFcRZccahD6Pd6Kt9z7CMme2MXXj6U/PvVK07EF9H6tJisEXIBFfgygpB3BDpz/fUMZvWNZRyuyv6bWyVdXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzPv9gc4; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzPv9gc4"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so7775352a12.1
        for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 05:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774872968; cv=none;
        d=google.com; s=arc-20240605;
        b=FUuzRZZL6a/+V/4tlitcTwKXooCS3cojKgxKKjAR1SDwlaVtpLUDqGyVmEfDG+252e
         WpO6MzoLPH3foCrPQoialo3qrhn8j4ZfxD72QjdBGnjgt8YISQKU/JDzIOjh6OGf2lDn
         rgOuAdqF7JUa1TKf48tCM1clrhjDRL3ikmUfvtL5xLfdDpGY5urvp3xvBJEHU7KxPDb4
         NtxztzGgAgMkX5AmDOaYMcKlVLJTMs59uK4L5EEJdVa4nmfx3yn59RE20/DrtOIkl977
         fAWV5dlHB9sVE96nTIhupE3RGaKV2T7xYxz8RonZThg6mRdCwqaPsnig/Tt87tFE6iSp
         v43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Uw35mKRYCMJg9FLMVpCEhFv3Apj6vxn4xy9VKcxb9Ow=;
        fh=rLgfHVnzHfSWlZjIKFkk6KMEAjTxe1gckcTLXNDtdmw=;
        b=k5bbTt8JsG14W2AM8e1+Koobk84jJVO8eF2v8dHpefUusvjDhl4o5XFo59WquYH99i
         jEALTYce+uUw1JPSbNK+HCDUBFfajiiegdpDLaKKM46Klr+DjwLuYBiJW5mMTPinltz9
         1dEaz8VPUml7x0Re9PIrSbXKOpSPTFaMPQdw5J3ePHVYmfBDesGp6HwlM/l5IKC18tGs
         BxIx4NX+4nO3JZu/nLHje5ztXYbfXnfarAgZtmPNdz1gAwTAuAvI6RQzrx9gYwHhlllg
         gs6SidLIgOq9XXkY2jq/PrXDxoa7W77hl+2OIR4SYzyA54Hh4bRlEE0JTW+CUC1/xiCk
         smug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774872968; x=1775477768; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw35mKRYCMJg9FLMVpCEhFv3Apj6vxn4xy9VKcxb9Ow=;
        b=BzPv9gc4f2iY9tFIJJbmNyuPC/kFlADW9lH6Awn1C9Smmel7k5yd6d5HaWXJ+TLySB
         Owa3o6KBNKcwNF+a2NxSPYFLQgiyQkO9rLfKghJhhYHM9rSZGqD8t7RrSR86a7qqlND3
         cMYvFevJWoa3J4AgJSDvCsyZvzfx2saACdFL7SlGEUIXMQ8WTLuBq05+CWhruFtPmq6j
         HHWncGr9qsipDpash3Skxzd3eTLPZH47EKlawKVGiPfXzD79ozR0aC0vWSQTqBodxHmI
         4QcaXpltxQHBwxKrlIoAdtkKgiDdKLW92b1PmpQIXlCjkr3iBITxAEuT0iwYnXuBbaPd
         45NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774872968; x=1775477768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uw35mKRYCMJg9FLMVpCEhFv3Apj6vxn4xy9VKcxb9Ow=;
        b=ijmZ3i+8+Vv0X6dSaNqJtA5CNcuSQ9ZCLs8UCCTqk0+EDBKTo0QizgRV/7HkVp/Dzt
         Sb60Q352sjcZeHQUt7CaK1tvPUWao8lGFrPAIf0QwrE5jrEpI7kwsHf4Dd22kanelUco
         LO33t+JUGJkEnpJRGUD6l+XGEsDFTyACUYyX63LfmzCtees6ZQh0Q6YIbPrJeTXhLJkd
         75G64kgQEyCpPb140tpU7zPS2tkJObYqezjYhs4WR4iwKr6/GQbIS+u7dvR4XJS60zQj
         gwrKbsoQM1CK1b5/ayAGfS9FpilCutx+/MZ57cem35Z8FOnBipkXsdf9jjwRJyGsHrD7
         A0mA==
X-Forwarded-Encrypted: i=1; AJvYcCVxjAnYf4phVxpWjPG93AqzaY0ulT4quQzM4EkQpfm87vw8AJPe17B525CW/2dS8ezG2ymm+vfxLg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1RhoDvcCA9TFbt8ijNm4vJeyXfkckiqfUvkEgeNI8Teo0VHlZ
	cAUeyS9U7Zo5TrppP40O7p5kcK/AkXo089b5QXtiYIWpUwipjsEWYLxmo/CqVRp9y1OVbw0fM/r
	LiZWOocFuWNPTDU0jzeg8xlfGpAUANLk=
X-Gm-Gg: ATEYQzzcssWvPE+0FcE9TgFCUsefMdgkvHVzPMkmeoTYJnrYEmCx5TQV2V2YM6k8X1m
	ya9x7HALDa2aqqgt+Nrsgdz7W8RqmJfhcIV4I113sdpwCVaaHkxO5EbUwZOGi0fzcXkMdSR+hUA
	DbvQai5JSFxUMCI1uRj+YXE+qsQwvZb6bDGjz/U/X7aGAxVBNyHx9d0sYlDyw+f8bHoq8ibj4zL
	1nJPFborLw4sormCbb5RNvwqhhUj2kXOlG9+67vMQqr7AkYSjScbOkZWFudC+LxqPS0mAgzoF9D
	MSTnYA==
X-Received: by 2002:a05:6402:280d:b0:66c:167a:30c2 with SMTP id
 4fb4d7f45d1cf-66c167a31f2mr564738a12.8.1774872968093; Mon, 30 Mar 2026
 05:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260326100010.3588454-1-amadeus@jmu.edu.cn> <20260326100010.3588454-2-amadeus@jmu.edu.cn>
In-Reply-To: <20260326100010.3588454-2-amadeus@jmu.edu.cn>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 30 Mar 2026 17:45:51 +0530
X-Gm-Features: AQROBzB-LqUMsU7GjSBa2raN-d9hzLimLXCwAQc0Z2nOV4SZWTpS5pDRv4Qty3w
Message-ID: <CANAwSgRO+mXtc09D=iVb1kvMHpkdekiwErRXZGoLYrwNtMSZqA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] usb: dwc3: Add optional VBUS regulator support to
 SpacemiT K1
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Yixun Lan <dlan@kernel.org>, 
	Ze Huang <huang.ze@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

hi Chukun,

On Thu, 26 Mar 2026 at 15:32, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Some SpacemiT K1 boards (like OrangePi R2S) provide USB VBUS
> through a controllable regulator. Add support for the optional
> vbus-supply property so the regulator can be properly managed
> in host mode instead of left always-on. Note that this doesn't
> apply to USB Hub downstream ports with different VBUS supplies.
>
> The enabled and disabled actions of the regulator are handled
> automatically by devm_regulator_get_enable_optional().
>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
