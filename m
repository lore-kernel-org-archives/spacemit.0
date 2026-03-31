Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB09366056
	for <spacemit@lists.linux.dev>; Tue, 31 Mar 2026 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954755; cv=pass; b=sVrYD2i3pmmMxanlgbzzjE0wmb3y/8lcd1XP6a/wPqeS2CGQ8nGz6/eZYvf68vWz7TUMaS1UR0ZNOmqdBxbrLEReoaNcT244EkacWG3QJOIMUUdCx7cG7dbslYy+E7f133++CkvECS8+GkXPy9WoH4UAYCx0X9hbfrVR9cd92bA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954755; c=relaxed/simple;
	bh=2VUtW0YpXM+NjDn8hDo/IqLapZK8BOphv1C4iFqDS7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kk23fzt309wD7YLEeP2tdQGGuXY1Jj64KIkh6FMN1azz/OOPONGzaN6mGtnuMqn/SXQO75dKkudLTfi6Vx1AJTeZVT2TKjml1dmWSeuyfVuyOlMZLLaRTGCjCizCqx1y12MwW/glKGi0ajQKo09Xr1aXxpjruzbFZ4YtFWTK1H0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YsKywtsW; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YsKywtsW"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59dea72099eso6829584e87.0
        for <spacemit@lists.linux.dev>; Tue, 31 Mar 2026 03:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774954751; cv=none;
        d=google.com; s=arc-20240605;
        b=OFI6xDElW5PWqoehzK616uW/t9194Da+wGv0pcAQjm/vouq5YOp/Ma++FQKQWastSi
         07HnZt4NqbkL8D5ULu1VT7eihFkYivUoc2JxnRTBv2GkZo0L/HRUvKrPNg7u/lzxG+hq
         XQLf4vG5KJxDivfYvWgHQ2Uep4U/jLGxqEy53YuhNEgiegNqwU+MCLfa/ahmpiSWKm2e
         bR/MLWVD7S9Yd3gLnscPOgvQXyLJu9WxhWqDA+A5nPOCY5ORtH6DtXfahwb9JvoHwYHv
         xypNyQZTMY4l6kfjiORwd6iPRRtAJKjORIzC8QccDZG+EFXxZ0PF9e1dg2Eak5kxCCDL
         38Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fL8mGMhRS7HqUOu1W0Z30JuQwLChCz1UuGa8bh9Su6c=;
        fh=DdsayIRrRiftDE+gMKvcDBdNsu/nE3rAt+6GutQ3XI8=;
        b=N/Iw0JKSAGQ3/mmdjMCyWNpF+VvZdwHiYnklXJPfUD5eWHMMSeHpHxQiRswHJtBTKX
         JI+m3I1i4K/vzOdRiAf6J/2bPQhbFx16tSge/B+mjDngPOQ9N70t6Rpmk63ih/BWcwQq
         MSITu7NSTWiK9ZvvwWhb1A6fPa6gl5bnjQAbtisLLSfQeINdCsCnoXgbZwuHUy0LaKhm
         o/y4uNbWKY5/78hQ0+Y2jnQJ7W0lcHMI0KClOCy3g26xWPT8qoRlHR0fpaHAqmLkWj0L
         2WIKpZByAgSVoUe/IRSJqV3VnJHOLNcR/qPkIRJoTLgWDwSuSGf4B7jdJfp55SuBY0Ev
         j65w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774954751; x=1775559551; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fL8mGMhRS7HqUOu1W0Z30JuQwLChCz1UuGa8bh9Su6c=;
        b=YsKywtsWrczglH9U3IsqEJaHcDUHt2ORIU5WO7oHTSR3Au7xaj/iyaLkiqO11aDk9C
         pDaf7pPitZHMivbqAIqlpJfNt3gF43kMnes/OSAjfObZwgZG64Y81TUTQ1e3tmDOKKGE
         qkgt64vBf3QkxYa8IFaThnRCQaO0WBwqZVlIhgTCn4AF6eMPGR5py+aucB0ABiHe0B2w
         hCp4tG/pQUrGkHyaxRTvsq5h7WCr4aMXMX1viVD7luEC54MPbP6ROFu1zMwhnVeNc02k
         GLsnqSKLpzhUyxOr3SW0DwACLdtnB4dGm4t7rU0W06AcuiKQnPMrqvk2UHVlF3FCjgIL
         6O9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774954751; x=1775559551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL8mGMhRS7HqUOu1W0Z30JuQwLChCz1UuGa8bh9Su6c=;
        b=ZWwde071ZpQtCajKe+gptrnhHQV8aSb0OthTs6M3sxaEV5FaKvHm3xb0LOdb78EuDc
         B+1H7IIBOYP+aZ4s/6HNFNUHFBrNQ6a4bwqMaVr9gaCg231/4xT56iVXz+WhZdyw9TLJ
         6V5FS3HUKYYlYiUFn6mMykkjSFWGr5gQ6TQoKN1/akFzX7TurU3Xi/czFokrD/XOQfdE
         RZXPQG6NYvLesvxSC0BdPB4ahgK6EzfDzEuWFNJbkmCC+udFxouyCmbBaDIMJWNX38Co
         ma6n7qPUkyfK0ae5bu6yR0qAx8HZRBmDJ7jZTskWR7uRn3dzgoctnyRDj86jgP3EtuSS
         Re9A==
X-Forwarded-Encrypted: i=1; AJvYcCXc7f4XYlqyQh1yucWLBauZofJR4aPCyGcCMMsLm27tbSRVSZ47cvUWgzxcpEnHLg6SwoZQxB2xoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YySZJA5up+a7W7BQEKc1TbaZtutPcOyMNjdD1UQiP6ssyiPCOqz
	E1fe85P3K5vwgh/MFkLlRArveTMOg8SdtiFhzflo6CqUfHq1J4IzZJPx5RI3Gz1S3qFsd9SpDWo
	ZQtSZsugciiHSaIagNFTYltrYb6XKFDg4j0bQHC1XaA==
X-Gm-Gg: ATEYQzzk+wpJPrlZdxTImTSXSVslyxFH44ydZJEM1H5c6Gt/bYEk6TVVIVYcNJVe9pc
	HNm/Spa9ZyDaHxOSYzdGHChb3NpTdg1vYEhz6PlNaRL7it8GgSR+YFzesVS5P24+86fTz5RxGBo
	jDujZzmbcdY+S5dDf/w0l7Yyktixi1Bu6lihyXRnP0DvSEtYB3lNjETD78V8Jb/h3gD7D+USd56
	wZAnIds1dwgTwjYEoNYDATG3Pufns2jlT/3kbvw0TjYAe7pZPhfBMwZ3UsprPIyrJMHPhiDRr4s
	rnenvrE+
X-Received: by 2002:a05:6512:3482:b0:5a2:b01e:5b5a with SMTP id
 2adb3069b0e04-5a2b01e5c9amr2976958e87.33.1774954750886; Tue, 31 Mar 2026
 03:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
 <20260330-orangepi-sd-card-uhs-v5-1-bd853604322d@gmail.com> <20260331-eager-kind-civet-62f60a@quoll>
In-Reply-To: <20260331-eager-kind-civet-62f60a@quoll>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 12:58:33 +0200
X-Gm-Features: AQROBzB11zXXvkr31NXEyNIIlW6o7ZaxcYR8a2pmCHpw6-PFnrMqVgTaVeOSgY4
Message-ID: <CAPDyKFrafqhNbetL5kOzAFO526yUrJWa6mS_FPX-cw9bj2Mg4Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Mar 2026 at 08:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Mar 30, 2026 at 10:38:02AM +0200, Iker Pedrosa wrote:
> > Document pinctrl properties to support voltage-dependent pin
> > configuration switching for UHS-I SD card modes.
> >
> > Add optional pinctrl-names property with two states:
> > - "default": For 3.3V operation with standard drive strength
> > - "state_uhs": For 1.8V operation with optimized drive strength
> >
> > These pinctrl states allow the SDHCI driver to coordinate voltage
> > switching with pin configuration changes, ensuring proper signal
> > integrity during UHS-I mode transitions.
> >
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >  .../devicetree/bindings/mmc/spacemit,sdhci.yaml         | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > index 9a055d963a7f0cdba4741c1e3e7269688dcd5f45..201ab97f0e88376a4680dcca7917e8b3172bd84a 100644
> > --- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > @@ -44,6 +44,20 @@ properties:
> >        - const: axi
> >        - const: sdh
> >
> > +  pinctrl-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      enum:
>
> No, that's not enum but list. Look here:
>
> > +        - default
> > +        - state_uhs
>
> Instead: uhs

While I agree that "uhs" would be better, we have tried to stick with
"state_uhs" for legacy and consistency reasons with other mmc
controllers.

No strong opinion though, what do you think?

[...]

Kind regards
Uffe
